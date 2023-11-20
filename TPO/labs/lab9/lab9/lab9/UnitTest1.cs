using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;

namespace lab9
{
    [TestClass]
    public class Tests
    {
        private IWebDriver driver;
        private KufarPage page;
        [TestInitialize]
        public void TestInitialize()
        {
            driver = new ChromeDriver();
            page = new KufarPage(driver);
        }

        
        [TestMethod]
        public void TestSearchByEnteredTextAndClassSelector()
        {
            page.OpenPage("https://www.kufar.by/l");
            Thread.Sleep(20000);
            page.EnterText("телефон");
            Thread.Sleep(2000);
            page.PressEnter();
        }

        [TestCleanup]
        public void TestCleanup()
        {
            Thread.Sleep(20000);
            driver.Quit();
        }
    }
}