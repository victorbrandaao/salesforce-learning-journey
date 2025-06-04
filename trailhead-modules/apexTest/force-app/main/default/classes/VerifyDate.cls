public class VerifyDate {
    public static Date checkDates(Date startDate, Date endDate, Date givenDate) {
        // Se a data fornecida estiver entre startDate e endDate (inclusive)
        if (givenDate >= startDate && givenDate <= endDate) {
            return givenDate; // Retorna a data fornecida
        } else {
            // Se a data fornecida estiver fora do intervalo
            // Retorna o último dia do mês da endDate
            // Note: AddMonths(0) é para garantir que estamos no mesmo mês, mas no último dia.
            return endDate.addMonths(0).toStartOfMonth().addMonths(1).addDays(-1);
        }
    }
}