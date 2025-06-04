trigger RestrictContactByName on Contact(before insert, before update) {
  // Itera sobre cada registro de Contato que está sendo inserido ou atualizado
  for (Contact con : Trigger.new) {
    // Verifica se o Sobrenome do Contato é 'INVALIDNAME' (case-insensitive)
    if (con.LastName != null && con.LastName.equalsIgnoreCase('INVALIDNAME')) {
      // Se for, adiciona um erro ao registro, impedindo o salvamento
      con.addError(
        'Não é possível inserir ou atualizar um contato com o sobrenome INVALIDNAME.'
      );
    }
  }
}
// Este gatilho impede a inserção ou atualização de contatos com o sobrenome 'INVALIDNAME'.
