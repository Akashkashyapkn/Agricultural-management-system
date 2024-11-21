# Generated by Selenium IDE
import pytest
import time
import json
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

class TestUploadProduct():
  def setup_method(self, method):
    self.driver = webdriver.Chrome()
    self.vars = {}
  
  def teardown_method(self, method):
    self.driver.quit()
  
  def test_uploadProduct(self):
    self.driver.get("http://localhost/jaas/")
    self.driver.set_window_size(1296, 688)
    self.driver.find_element(By.LINK_TEXT, "My Profile: Ba").click()
    self.driver.find_element(By.LINK_TEXT, "Upload Product").click()
    self.driver.find_element(By.NAME, "productPic").click()
    self.driver.find_element(By.ID, "type").click()
    dropdown = self.driver.find_element(By.ID, "type")
    dropdown.find_element(By.XPATH, "//option[. = 'Fruit']").click()
    self.driver.find_element(By.ID, "pname").click()
    self.driver.find_element(By.ID, "pname").send_keys("Banana")
    self.driver.find_element(By.ID, "price").click()
    self.driver.find_element(By.ID, "price").send_keys("100")
    self.driver.find_element(By.CSS_SELECTOR, ".glyphicon-grain").click()
    self.driver.find_element(By.CSS_SELECTOR, ".\\34u\\$ img").click()
    self.driver.find_element(By.ID, "two").click()
    self.driver.find_element(By.CSS_SELECTOR, "#two > .container").click()
    self.driver.find_element(By.CSS_SELECTOR, ".col-md-4:nth-child(6) .image").click()
    self.driver.find_element(By.CSS_SELECTOR, ".container > .row:nth-child(1)").click()
    self.driver.find_element(By.CSS_SELECTOR, ".button").click()
  