trigger AccountAddressTrigger on Account(before insert, before update) {
  // Itera sobre cada registro de Conta que está sendo inserido ou atualizado
  // Trigger.new contém os registros que estão sendo processados na transação atual
  for (Account acc : Trigger.new) {
    // Condição: Verifica se o campo 'Match_Billing_Address__c' está marcado como TRUE
    // e se o BillingPostalCode não é nulo.
    // A lógica de 'before insert' e 'before update' permite que modifiquemos o registro diretamente.
    if (acc.Match_Billing_Address__c == true && acc.BillingPostalCode != null) {
      // Operação: Define o CEP de envio (ShippingPostalCode) igual ao CEP de cobrança (BillingPostalCode)
      acc.ShippingPostalCode = acc.BillingPostalCode;
    }
  }
}