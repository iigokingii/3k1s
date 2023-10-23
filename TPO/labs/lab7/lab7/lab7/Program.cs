using System;
using System.ComponentModel;

namespace Lab7
{
    /// <summary>
    /// Bank account demo class.
    /// </summary>
    public class BankAccount
    {
        private string m_customerName;
        private double m_balance;
        private string password;
        public const string DebitAmountExceedsBalanceMessage = "Debit amount exceeds balance";
        public const string DebitAmountLessThanZeroMessage = "Debit amount is less than zero";
        public const string BalanceAmountLessThanZeroMessage = "Begining balance is less than zero";
        public const string CreditAmountLessThanZeroMessage = "Credit amount is less than zero";
        public const string PasswordIsTooShort = "Password is too short";
        public const string PasswordIsTooLong = "Password is too long";
        public const string PasswordIsTooEasy = "Password is too easy";


        private BankAccount() { }

        public BankAccount(string customerName, double balance)
        {
            m_customerName = customerName;
            Balance = balance;
        }
        public void SetPassword(string pass)
        {
            Password = pass;
        }
        
        public string Password
        {
            set
            {
                if (value.Length < 4)
                {
                    throw new ArgumentOutOfRangeException("password", value, PasswordIsTooShort);
                }
                if (value.Length > 22)
                {
                    throw new ArgumentOutOfRangeException("password", value, PasswordIsTooLong);
                }
                if (value == "123456789" || value == "qwerty")
                {
                    throw new ArgumentException("Password is too easy");
                }
                password = value;
            }
            get { return password; }
        }

        public string CustomerName
        {
            get { return m_customerName; }
        }

        public double Balance
        {
            set
            {
                if (value < 0)
                {
                    throw new ArgumentOutOfRangeException("m_balance", value, BalanceAmountLessThanZeroMessage);
                }
                m_balance = value;
            }
            get { return m_balance; }
        }

        public void Debit(double amount)
        {
            if (amount > m_balance)
            {
                throw new System.ArgumentOutOfRangeException("amount", amount, DebitAmountExceedsBalanceMessage);
            }

            if (amount < 0)
            {
                throw new System.ArgumentOutOfRangeException("amount", amount, DebitAmountLessThanZeroMessage);
            }

            m_balance -= amount;
        }

        public void Credit(double amount)
        {
            if (amount < 0)
            {
                throw new ArgumentOutOfRangeException("amount",amount,CreditAmountLessThanZeroMessage);
            }

            m_balance += amount;
        }

        public static void Main()
        {
            BankAccount ba = new BankAccount("Panchuk", 11.99);

            ba.Credit(5.77);
            ba.Debit(11.22);
            Console.WriteLine("Current balance is ${0}", ba.Balance);
        }
    }
}