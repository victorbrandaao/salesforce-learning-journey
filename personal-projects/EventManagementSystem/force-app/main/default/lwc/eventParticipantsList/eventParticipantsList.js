import { LightningElement, api, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi"; // Para pegar a capacidade do Evento
import { ShowToastEvent } from "lightning/platformShowToastEvent"; // Para mensagens de notificação
import { NavigationMixin } from "lightning/navigation"; // Para navegação

// Importar campos do Evento
import MAX_CAPACITY_FIELD from "@salesforce/schema/Event__c.Max_Capacity__c";

// Importar um método Apex (ainda vamos criar)
import getParticipantsByEventId from "@salesforce/apex/EventParticipantController.getParticipantsByEventId";

export default class EventParticipantsList extends NavigationMixin(
  LightningElement
) {
  @api recordId; // Este atributo é automaticamente preenchido com o ID do registro quando o LWC está na página de registro

  participants = {}; // Armazena os dados dos participantes
  maxCapacity = 0; // Armazena a capacidade máxima do evento
  currentParticipants = 0; // Armazena o número atual de participantes
  percentageFull = 0; // Armazena a porcentagem de ocupação

  // Wire service para obter os detalhes do Evento (especificamente a capacidade máxima)
  @wire(getRecord, { recordId: "$recordId", fields: [MAX_CAPACITY_FIELD] })
  wiredEvent({ error, data }) {
    if (data) {
      this.maxCapacity = data.fields.Max_Capacity__c.value || 0;
      this.updateCapacityDisplay(); // Atualiza a exibição após obter a capacidade
    } else if (error) {
      this.showToast(
        "Erro",
        "Erro ao carregar capacidade do evento: " + error.body.message,
        "error"
      );
      console.error("Erro ao carregar capacidade do evento", error);
    }
  }

  // Wire service para obter os participantes do Evento
  @wire(getParticipantsByEventId, { eventId: "$recordId" })
  wiredParticipants({ error, data }) {
    if (data) {
      this.participants.data = data;
      this.participants.error = undefined;
      this.currentParticipants = data.length;
      this.updateCapacityDisplay(); // Atualiza a exibição após obter os participantes
    } else if (error) {
      this.participants.error = error;
      this.participants.data = undefined;
      this.showToast(
        "Erro",
        "Erro ao carregar participantes: " + error.body.message,
        "error"
      );
      console.error("Erro ao carregar participantes", error);
    }
  }

  // Método para atualizar os cálculos de capacidade e porcentagem
  updateCapacityDisplay() {
    if (this.maxCapacity > 0) {
      this.percentageFull = Math.min(
        100,
        (this.currentParticipants / this.maxCapacity) * 100
      );
    } else {
      this.percentageFull = 0; // Se não houver capacidade máxima, porcentagem é 0
    }
  }

  // Método para lidar com o clique do botão "Adicionar Novo Participante"
  handleAddParticipant() {
    // Navega para a página de criação de novo Participant__c
    this[NavigationMixin.Navigate]({
      type: "standard__objectPage",
      attributes: {
        objectApiName: "Participant__c",
        actionName: "new"
      },
      state: {
        // Preenche automaticamente o campo Event__c no novo Participant__c
        nooverride: "1", // Evita que o override padrão do Salesforce seja aplicado (se houver)
        defaultFieldValues: JSON.stringify({
          Event__c: this.recordId
        })
      }
    });
  }

  // Método auxiliar para exibir mensagens Toast (notificações)
  showToast(title, message, variant) {
    const event = new ShowToastEvent({
      title: title,
      message: message,
      variant: variant
    });
    this.dispatchEvent(event);
  }
}
