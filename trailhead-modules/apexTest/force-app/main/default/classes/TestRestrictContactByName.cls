@IsTest
private class TestRestrictContactByName {
  // Cenário 1: Testar inserção de contato com nome VÁLIDO (deve passar)
  @IsTest
  static void testValidContactInsert() {
    // Preparar dados (Arrange)
    Contact validCon = new Contact(FirstName = 'Test', LastName = 'ValidName');

    // Executar a lógica (Act)
    Test.startTest();
    Database.SaveResult sr = Database.insert(validCon, false); // false para capturar SaveResult
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assert(
      sr.isSuccess(),
      'O contato com nome válido deveria ter sido salvo.'
    );
    System.assertEquals(
      0,
      sr.getErrors().size(),
      'Não deveria haver erros de validação.'
    );
  }

  // Cenário 2: Testar inserção de contato com sobrenome 'INVALIDNAME' (deve FALHAR)
  @IsTest
  static void testInvalidContactInsert() {
    // Preparar dados (Arrange)
    Contact invalidCon = new Contact(
      FirstName = 'Test',
      LastName = 'INVALIDNAME'
    );

    // Executar a lógica (Act)
    Test.startTest();
    Database.SaveResult sr = Database.insert(invalidCon, false);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assert(
      !sr.isSuccess(),
      'O contato com sobrenome INVÁLIDO não deveria ter sido salvo.'
    );
    System.assertEquals(
      1,
      sr.getErrors().size(),
      'Deve haver um erro de validação.'
    );
    System.assert(
      sr.getErrors()[0].getMessage().contains('INVALIDNAME'),
      'A mensagem de erro deve mencionar INVALIDNAME.'
    );
  }

  // Cenário 3: Testar atualização de contato para sobrenome 'INVALIDNAME' (deve FALHAR)
  @IsTest
  static void testInvalidContactUpdate() {
    // Preparar dados (Arrange)
    Contact originalCon = new Contact(
      FirstName = 'Test',
      LastName = 'OriginalName'
    );
    insert originalCon; // Inserir primeiro um contato válido

    // Executar a lógica (Act)
    Test.startTest();
    originalCon.LastName = 'INVALIDNAME'; // Tentar atualizar para nome inválido
    Database.SaveResult sr = Database.update(originalCon, false); // Usar update com false
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assert(
      !sr.isSuccess(),
      'A atualização para sobrenome INVÁLIDO não deveria ter sido permitida.'
    );
    System.assertEquals(
      1,
      sr.getErrors().size(),
      'Deve haver um erro de validação.'
    );
    System.assert(
      sr.getErrors()[0].getMessage().contains('INVALIDNAME'),
      'A mensagem de erro deve mencionar INVALIDNAME.'
    );
  }

  // Cenário 4: Testar inserção em massa com alguns contatos 'INVALIDNAME' (Bulkified)
  @IsTest
  static void testBulkContactInsert() {
    // Preparar dados (Arrange)
    List<Contact> contactsToInsert = new List<Contact>();
    contactsToInsert.add(new Contact(FirstName = 'Valid', LastName = 'One'));
    contactsToInsert.add(
      new Contact(FirstName = 'Invalid', LastName = 'INVALIDNAME')
    ); // Inválido
    contactsToInsert.add(new Contact(FirstName = 'Valid', LastName = 'Two'));
    contactsToInsert.add(
      new Contact(FirstName = 'Another Invalid', LastName = 'invalidname')
    ); // Inválido (case-insensitive)

    // Executar a lógica (Act)
    Test.startTest();
    Database.SaveResult[] results = Database.insert(contactsToInsert, false);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assertEquals(
      4,
      results.size(),
      'Deveriam ser 4 resultados de SaveResult.'
    );

    // Verificar resultados individuais:
    // Contato 1 (válido)
    System.assert(
      results[0].isSuccess(),
      'O primeiro contato válido deveria ser salvo.'
    );
    // Contato 2 (inválido)
    System.assert(
      !results[1].isSuccess(),
      'O segundo contato inválido não deveria ser salvo.'
    );
    System.assertEquals(
      1,
      results[1].getErrors().size(),
      'Deveria haver 1 erro para o segundo contato.'
    );
    // Contato 3 (válido)
    System.assert(
      results[2].isSuccess(),
      'O terceiro contato válido deveria ser salvo.'
    );
    // Contato 4 (inválido)
    System.assert(
      !results[3].isSuccess(),
      'O quarto contato inválido não deveria ser salvo.'
    );
    System.assertEquals(
      1,
      results[3].getErrors().size(),
      'Deveria haver 1 erro para o quarto contato.'
    );

    // Opcional: Contar quantos contatos foram realmente salvos (2 válidos)
    Integer savedContactsCount = [
      SELECT COUNT()
      FROM Contact
      WHERE LastName != 'INVALIDNAME' AND LastName != 'invalidname'
    ];
    System.assertEquals(
      2,
      savedContactsCount,
      'Apenas os contatos válidos deveriam ter sido salvos.'
    );
  }

  // Cenário 5: Testar atualização em massa com alguns contatos se tornando 'INVALIDNAME' (Bulkified)
  @IsTest
  static void testBulkContactUpdate() {
    // Preparar dados (Arrange)
    List<Contact> originalContacts = new List<Contact>();
    originalContacts.add(new Contact(FirstName = 'Test', LastName = 'BulkOne'));
    originalContacts.add(new Contact(FirstName = 'Test', LastName = 'BulkTwo'));
    originalContacts.add(
      new Contact(FirstName = 'Test', LastName = 'BulkThree')
    );
    insert originalContacts; // Inserir contatos válidos

    // Modificar para atualizar alguns para 'INVALIDNAME'
    originalContacts[0].LastName = 'ChangedOne'; // Válido
    originalContacts[1].LastName = 'INVALIDNAME'; // Inválido
    originalContacts[2].LastName = 'INVALIDNAME'; // Inválido

    // Executar a lógica (Act)
    Test.startTest();
    Database.SaveResult[] results = Database.update(originalContacts, false);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assertEquals(
      3,
      results.size(),
      'Deveriam ser 3 resultados de SaveResult.'
    );

    // Contato 1 (válido)
    System.assert(
      results[0].isSuccess(),
      'O primeiro contato atualizado deveria ser salvo.'
    );
    // Contato 2 (inválido)
    System.assert(
      !results[1].isSuccess(),
      'O segundo contato atualizado para INVÁLIDO não deveria ser salvo.'
    );
    System.assertEquals(
      1,
      results[1].getErrors().size(),
      'Deveria haver 1 erro para o segundo contato.'
    );
    // Contato 3 (inválido)
    System.assert(
      !results[2].isSuccess(),
      'O terceiro contato atualizado para INVÁLIDO não deveria ser salvo.'
    );
    System.assertEquals(
      1,
      results[2].getErrors().size(),
      'Deveria haver 1 erro para o terceiro contato.'
    );

    // Opcional: Verificar o estado final dos contatos no banco de dados
    List<Contact> finalContacts = [
      SELECT Id, LastName
      FROM Contact
      WHERE Id IN :originalContacts
    ];
    // O primeiro deveria ter sido atualizado, os outros dois deveriam ter o nome original
    System.assertEquals(
      'ChangedOne',
      finalContacts[0].LastName,
      'O primeiro contato deveria ter sido atualizado.'
    );
    System.assertEquals(
      'BulkTwo',
      finalContacts[1].LastName,
      'O segundo contato deveria ter mantido o nome original.'
    );
    System.assertEquals(
      'BulkThree',
      finalContacts[2].LastName,
      'O terceiro contato deveria ter mantido o nome original.'
    );
  }
}
