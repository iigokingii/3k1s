using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab9
{
    public class KufarPage
    {
        private IWebDriver driver;
        private WebDriverWait wait;
        public KufarPage(IWebDriver _driver)
        {
            driver = _driver;
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
        }
        public void OpenPage(string url)
        {
            driver.Navigate().GoToUrl(url);
        }
        public void EnterText(string text)
        {
            IWebElement input = driver.FindElement(By.ClassName("styles_input__IvCG7"));
            input.SendKeys(text);
        }
        public void PressEnter()
        {
            driver.FindElement(By.ClassName("styles_search_button__Ro1wM")).Click();
        }
        public void FindAndSetCategory(string _category)
        {
            driver.FindElement(By.XPath("//*[@id=\"header\"]/div[1]/div[1]/button")).Click();
            driver.FindElement(By.XPath("//*[@id=\"__next\"]/div/div[2]/div/div/div[1]/div[6]/a")).Click();

            //driver.FindElement(By.XPath("//*[@id=\"__next\"]/div/div[2]/div[2]/div[2]/div/div/div[1]/a")).Click();
            /*var listOfTelephoneCategory = driver.FindElements(By.CssSelector("styles_link__wrapper__F6sJT styles_link__wrapper--category-mob__xcjEG"));
            foreach (var category in listOfTelephoneCategory)
            {
                if (category.GetAttribute("testid") == _category)
                {
                    category.Click();
                }
            }*/

        }
        public void LikeItem(int id)
        {
            driver.FindElement(By.XPath("//*[@id=\"main-content\"]/div[6]/div[1]/div/div[2]/div[2]/div/div/section[2]/a/div[2]/div[1]/div[2]/div")).Click();
        }



    }
}
