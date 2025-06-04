public with sharing class EventParticipantService {
  // Método exposto para o LWC para buscar participantes
  @AuraEnabled(cacheable=true)
  public static List<Participant__c> getParticipantsByEventId(Id eventId) {
    return [
      SELECT Id, Name, Email__c
      FROM Participant__c
      WHERE Event__c = :eventId
      ORDER BY Name ASC
    ];
  }

  // Método para validar a capacidade do evento, chamado pelo Trigger
  public static void validateEventCapacity(
    List<Participant__c> newParticipants
  ) {
    Set<Id> eventIds = new Set<Id>();
    for (Participant__c p : newParticipants) {
      // Garante que só validamos participantes que estão sendo associados a um evento
      if (p.Event__c != null) {
        eventIds.add(p.Event__c);
      }
    }

    // Se não houver eventos associados, não há nada para validar
    if (eventIds.isEmpty()) {
      return;
    }

    // Mapeia EventId para o objeto Evento completo, incluindo a lista de Participantes atuais.
    // A subconsulta (SELECT Id FROM Participants__r) é essencial para contar os participantes existentes.
    Map<Id, Event__c> eventsWithDetails = new Map<Id, Event__c>(
      [
        SELECT Id, Name, Max_Capacity__c, (SELECT Id FROM Participants__r)
        FROM Event__c
        WHERE Id IN :eventIds
      ]
    );

    // Conjunto para armazenar Eventos que já atingiram sua capacidade para evitar re-cálculos
    Set<Id> fullEvents = new Set<Id>();

    for (Participant__c newP : newParticipants) {
      // Só processa se o participante estiver associado a um evento válido e o evento ainda não foi marcado como lotado
      if (
        newP.Event__c != null &&
        eventsWithDetails.containsKey(newP.Event__c) &&
        !fullEvents.contains(newP.Event__c)
      ) {
        Event__c relatedEvent = eventsWithDetails.get(newP.Event__c);

        Integer currentAttendees = relatedEvent.Participants__r != null
          ? relatedEvent.Participants__r.size()
          : 0;
        Integer maxCapacity = relatedEvent.Max_Capacity__c != null
          ? (Integer) relatedEvent.Max_Capacity__c
          : 0;

        // Contamos também os participantes que estão sendo inseridos na mesma transação.
        // Isso evita o erro de "sobrecarga" quando vários participantes são inseridos de uma vez.
        Integer participantsBeingInsertedInThisTransaction = 0;
        for (Participant__c pInTransaction : newParticipants) {
          if (pInTransaction.Event__c == relatedEvent.Id) {
            participantsBeingInsertedInThisTransaction++;
          }
        }

        if (
          maxCapacity > 0 &&
          (currentAttendees + participantsBeingInsertedInThisTransaction >
          maxCapacity)
        ) {
          // Adiciona um erro ao campo Event__c do participante, impedindo o salvamento
          newP.Event__c.addError(
            'Este evento atingiu sua capacidade máxima de ' +
              maxCapacity +
              ' participantes.'
          );
          // Adiciona o evento ao conjunto de eventos lotados para não validar novamente
          fullEvents.add(relatedEvent.Id);
        }
      }
    }
  }
}
