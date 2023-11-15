using Lab7;
namespace Lab7Tests
{
    [TestClass]
    public class Lab7Tests
    {
        //#1
        [TestMethod]
        public void Debit_WithValidAmount_UpdatesBalance()
        {
            // Arrange
            double beginningBalance = 11.99;
            double debitAmount = 4.55;
            double expected = 7.44;
            BankAccount account = new BankAccount("Panchuk", beginningBalance);
            // Act
            account.Debit(debitAmount);
            // Assert
            double actual = account.Balance;
            Assert.AreEqual(expected, actual, 0.001, "Account not debited correctly");
        }
        //#2
        [TestMethod]
        public void Debit_WhenAmountIsMoreThanBalance_ShouldThrowArgumentOutOfRange()
        {
            // Arrange
            double beginningBalance = 11.99;
            double debitAmount = 20.0;
            BankAccount account = new BankAccount("adamovich", beginningBalance);

            // Act
            try
            {
                account.Debit(debitAmount);
            }
            catch (ArgumentOutOfRangeException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.DebitAmountExceedsBalanceMessage);
                return;
            }

            Assert.Fail("The expected exception was not thrown.");
        }
        //#3
        [TestMethod]
        public void CreateAccount_WhenBalanceIsLessThanZero_ShouldThrowArgumentOutOfRange()
        {
            //Arrange
            double beginningBalance = -20;
            try
            {
                BankAccount account = new BankAccount("Smolik", beginningBalance);
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //Assert
                StringAssert.Contains(ex.Message, BankAccount.BalanceAmountLessThanZeroMessage);
                return;
            }
            Assert.Fail("The expected exception was not thrown.");
        }
        //#4
        [TestMethod]
        public void Debit_WhenDebitAmountIsLessThanZero_ShouldThrowArgumentOutOfRange()
        {
            // Arrange
            double beginningBalance = 11.99;
            double debitAmount = -20.0;
            BankAccount account = new BankAccount("Makrush", beginningBalance);

            // Act
            try
            {
                account.Debit(debitAmount);
            }
            catch (ArgumentOutOfRangeException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.DebitAmountLessThanZeroMessage);
                return;
            }

            Assert.Fail("The expected exception was not thrown.");
        }
        //#5
        [TestMethod]
        public void Credit_WhenCreditAmountIsLessThanZero_ShouldThrowArgumentOutOfRange()
        {
            // Arrange
            double beginningBalance = 11.99;
            double creditAmount = -20.0;
            BankAccount account = new BankAccount("Alfer", beginningBalance);

            // Act
            try
            {
                account.Credit(creditAmount);
            }
            catch (ArgumentOutOfRangeException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.CreditAmountLessThanZeroMessage);
                return;
            }

            Assert.Fail("The expected exception was not thrown.");
        }
        //#6
        [TestMethod]
        public void Credit_WithValidAmount_UpdatesBalance()
        {
            // Arrange
            double beginningBalance = 11.99;
            double debitAmount = 4.01;
            double expected = 16;
            BankAccount account = new BankAccount("Adamovich", beginningBalance);
            // Act
            account.Credit(debitAmount);
            // Assert
            double actual = account.Balance;
            Assert.AreEqual(expected, actual, 0.001, "Account not debited correctly");
        }
        //#7
        [TestMethod]
        public void SetShortPassword_ShouldThrowArgumentOutOfRange()
        {
            // Arrange
            double beginningBalance = 11.99;
            BankAccount account = new BankAccount("Semkin", beginningBalance);

            // Act
            try
            {
                account.SetPassword("qwe");
            }
            catch (ArgumentOutOfRangeException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.PasswordIsTooShort);
                return;
            }

            Assert.Fail("The expected exception was not thrown.");
        }
        //#8
        [TestMethod]
        public void SetEasyPassword_ShouldThrowArgumentException()
        {
            // Arrange
            double beginningBalance = 11.99;
            BankAccount account = new BankAccount("Alfer", beginningBalance);

            // Act
            try
            {
                account.SetPassword("qwerty");
            }
            catch (ArgumentException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.PasswordIsTooEasy);
                return;
            }

            Assert.Fail("The expected exception was not thrown.");
        }
        //#9
        [TestMethod]
        public void SetNormalPassword_toBankAccount()
        {
            // Arrange
            double beginningBalance = 11.99;
            BankAccount account = new BankAccount("Gotovko", beginningBalance);
            // Act
            try
            {
                account.SetPassword("QSFrwq@2123");
            }
            catch (ArgumentException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.PasswordIsTooEasy);
                return;
            }
        }
        //#10
        [TestMethod]
        public void SetLongPassword_ShouldThrowArgumentOutOfRange()
        {
            // Arrange
            double beginningBalance = 11.99;
            BankAccount account = new BankAccount("Yatskevich", beginningBalance);
            // Act
            try
            {
                account.SetPassword("QSFrwq@2123222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
            }
            catch (ArgumentException e)
            {
                // Assert
                StringAssert.Contains(e.Message, BankAccount.PasswordIsTooLong);
                return;
            }
            Assert.Fail("The expected exception was not thrown.");
        }

    }
}