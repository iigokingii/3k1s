using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab9
{
    [TestClass]
    public class UnitTest3
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
        public void TestOpportunityToAddCategoryToSearchAndAddToLiked()
        {
            page.OpenPage("https://www.kufar.by/l");
            Thread.Sleep(20000);
            page.EnterText("Телефон");
            Thread.Sleep(2000);
            page.PressEnter();
            Thread.Sleep(3000);
            page.FindAndSetCategory("Мобильные телефоны");
            Thread.Sleep(4000);
            page.LikeItem(1);
        }
        [TestCleanup]
        public void TestCleanup()
        {
            Thread.Sleep(20000);
            driver.Quit();
        }
    }
}
