@IsTest
private class TestVerifyDate {
  // Cenário 1: givenDate está DENTRO do intervalo startDate e endDate
  @IsTest
  static void testGivenDateWithinRange() {
    // Preparar dados (Arrange)
    Date startDate = Date.newInstance(2025, 1, 1);
    Date endDate = Date.newInstance(2025, 1, 31);
    Date givenDate = Date.newInstance(2025, 1, 15); // Data dentro do intervalo

    // Executar a lógica (Act)
    Test.startTest();
    Date resultDate = VerifyDate.checkDates(startDate, endDate, givenDate);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assertEquals(
      givenDate,
      resultDate,
      'A data retornada deve ser a givenDate quando está dentro do intervalo.'
    );
  }

  // Cenário 2: givenDate está ANTES do startDate (fora do intervalo)
  @IsTest
  static void testGivenDateBeforeRange() {
    // Preparar dados (Arrange)
    Date startDate = Date.newInstance(2025, 2, 1);
    Date endDate = Date.newInstance(2025, 2, 28); // Fevereiro de 2025 tem 28 dias
    Date givenDate = Date.newInstance(2025, 1, 10); // Data antes do intervalo

    // Executar a lógica (Act)
    Test.startTest();
    Date resultDate = VerifyDate.checkDates(startDate, endDate, givenDate);
    Test.stopTest();

    // Validar o resultado (Assert)
    // Esperamos o último dia do mês da endDate (28/02/2025)
    Date expectedDate = Date.newInstance(2025, 2, 28);
    System.assertEquals(
      expectedDate,
      resultDate,
      'A data retornada deve ser o último dia do mês da endDate quando givenDate está antes do intervalo.'
    );
  }

  // Cenário 3: givenDate está DEPOIS do endDate (fora do intervalo)
  @IsTest
  static void testGivenDateAfterRange() {
    // Preparar dados (Arrange)
    Date startDate = Date.newInstance(2025, 3, 1);
    Date endDate = Date.newInstance(2025, 3, 31);
    Date givenDate = Date.newInstance(2025, 4, 10); // Data depois do intervalo

    // Executar a lógica (Act)
    Test.startTest();
    Date resultDate = VerifyDate.checkDates(startDate, endDate, givenDate);
    Test.stopTest();

    // Validar o resultado (Assert)
    // Esperamos o último dia do mês da endDate (31/03/2025)
    Date expectedDate = Date.newInstance(2025, 3, 31);
    System.assertEquals(
      expectedDate,
      resultDate,
      'A data retornada deve ser o último dia do mês da endDate quando givenDate está depois do intervalo.'
    );
  }

  // Cenário 4: givenDate é exatamente startDate (limite inferior)
  @IsTest
  static void testGivenDateEqualsStartDate() {
    // Preparar dados (Arrange)
    Date startDate = Date.newInstance(2025, 5, 1);
    Date endDate = Date.newInstance(2025, 5, 31);
    Date givenDate = startDate; // Data igual ao início do intervalo

    // Executar a lógica (Act)
    Test.startTest();
    Date resultDate = VerifyDate.checkDates(startDate, endDate, givenDate);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assertEquals(
      givenDate,
      resultDate,
      'A data retornada deve ser a givenDate quando é igual ao startDate.'
    );
  }

  // Cenário 5: givenDate é exatamente endDate (limite superior)
  @IsTest
  static void testGivenDateEqualsEndDate() {
    // Preparar dados (Arrange)
    Date startDate = Date.newInstance(2025, 6, 1);
    Date endDate = Date.newInstance(2025, 6, 30);
    Date givenDate = endDate; // Data igual ao fim do intervalo

    // Executar a lógica (Act)
    Test.startTest();
    Date resultDate = VerifyDate.checkDates(startDate, endDate, givenDate);
    Test.stopTest();

    // Validar o resultado (Assert)
    System.assertEquals(
      givenDate,
      resultDate,
      'A data retornada deve ser a givenDate quando é igual ao endDate.'
    );
  }
}
