public class RandomContactFactory { // Removida a anotação @isTest (conforme requisito do Trailhead)
  // Método público e estático para gerar uma lista de contatos
  // Parâmetro 1: numContacts - número de contatos a serem gerados
  // Parâmetro 2: commonLastName - sobrenome comum para todos os contatos
  // Retorno: List<Contact> - lista dos contatos gerados (NÃO INSERIDOS NO BD)
  public static List<Contact> generateRandomContacts(
    Integer numContacts,
    String commonLastName
  ) {
    // Removida a anotação @isTest

    // Lista para armazenar os contatos que serão gerados
    List<Contact> contacts = new List<Contact>();

    // Loop para gerar o número especificado de contatos
    for (Integer i = 0; i < numContacts; i++) {
      // Cria uma nova instância de Contato
      Contact con = new Contact();

      // Define o FirstName (Nome) no formato "Teste 0", "Teste 1", etc.
      con.FirstName = 'Teste ' + i;

      // Define o LastName (Sobrenome) com o valor comum fornecido
      con.LastName = commonLastName;

      // Opcional: Para tornar o contato mais "real", pode-se adicionar um Email
      // Isso não é pedido, mas é uma boa prática para dados de teste
      con.Email = 'teste' + i + '@' + commonLastName.toLowerCase() + '.com';

      // Adiciona o contato à lista
      contacts.add(con);
    }

    // Retorna a lista de contatos gerados, sem inseri-los no banco de dados
    return contacts;
  }
}
