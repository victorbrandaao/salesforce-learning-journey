trigger ClosedOpportunityTrigger on Opportunity(after insert, after update) {
  // Lista para armazenar as novas tarefas que serão criadas
  List<Task> tasksToCreate = new List<Task>();

  // Itera sobre cada registro de Oportunidade que foi inserido ou atualizado
  // Trigger.new contém os registros na transação DML atual
  for (Opportunity opp : Trigger.new) {
    // Condição para verificar se a Oportunidade foi fechada como 'Closed Won'
    // E se ela realmente MUDOU para 'Closed Won' (em caso de atualização)
    // ou se foi inserida diretamente como 'Closed Won'.

    // Para 'after update', precisamos comparar o novo valor com o antigo.
    // Usamos Trigger.oldMap para acessar o valor da Oportunidade antes da atualização.
    if (Trigger.isUpdate) {
      // Se a fase da oportunidade MUDOU para 'Closed Won'
      // E a fase ANTERIOR não era 'Closed Won' (evita criar tarefas duplicadas se a fase já era Closed Won)
      if (
        opp.StageName == 'Closed Won' &&
        Trigger.oldMap.get(opp.Id).StageName != 'Closed Won'
      ) {
        // Cria uma nova tarefa e a associa à oportunidade atual
        Task newTask = new Task(
          Subject = 'Tarefa de teste de acompanhamento',
          WhatId = opp.Id // Associa a tarefa à Oportunidade
        );
        tasksToCreate.add(newTask);
      }
    }
    // Para 'after insert', apenas verifica se a fase é 'Closed Won'
    else if (Trigger.isInsert) {
      if (opp.StageName == 'Closed Won') {
        // Cria uma nova tarefa e a associa à oportunidade atual
        Task newTask = new Task(
          Subject = 'Tarefa de teste de acompanhamento',
          WhatId = opp.Id
        );
        tasksToCreate.add(newTask);
      }
    }
  }

  // BULKIFICATION:
  // Fora do loop, verifica se há tarefas para criar.
  // Se houver, insere todas as tarefas em uma única operação DML.
  // Isso é crucial para evitar exceder o limite de 150 operações DML por transação.
  if (!tasksToCreate.isEmpty()) {
    insert tasksToCreate;
  }
}