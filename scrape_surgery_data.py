from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait

def get_surgery_data():
    return [
        '{"surgery": "Ear Surgery", "doctor": "Dr. Abdul Razak Khan", "hospital":"Vancouver General Hospital", "median": "41 Weeks", "ninety": "62 Weeks"}',
        '{"surgery": "Eye Surgery", "doctor": "Dr. Cindy Lu", "hospital":"Surrey Memorial Hospital", "median": "41 Weeks", "ninety": "62 Weeks"}',
        '{"surgery": "Knee Surgery", "doctor": "Dr. Jignesh Patel", "hospital":"Vancouver General Hospital", "median": "31 Weeks", "ninety": "56 Weeks"}',
        '{"surgery": "Open Heart Bypass", "doctor": "Dr. Sahil Shah", "hospital":"Vancouver General Hospital", "median": "41 Weeks", "ninety": "62 Weeks"}',
        '{"surgery": "Brain Surgery", "doctor": "Dr. Ali Khan", "hospital":"Vancouver General Hospital", "median": "34 Weeks", "ninety": "32 Weeks"}',
        '{"surgery": "ACL Surgery", "doctor": "Dr. Ritvik Gupta", "hospital":"Burnaby General Hospital", "median": "48 Weeks", "ninety": "42 Weeks"}',
        '{"surgery": "Ear Surgery", "doctor": "Dr. Anmol Singh", "hospital":"Vancouver General Hospital", "median": "41 Weeks", "ninety": "52 Weeks"}',
        '{"surgery": "Eye Surgery", "doctor": "Dr. Xing-Dong Chen", "hospital":"Surrey Memorial Hospital", "median": "24 Weeks", "ninety": "35 Weeks"}',
        '{"surgery": "Knee Surgery", "doctor": "Dr. Wall T. Disnee", "hospital":"Vancouver General Hospital", "median": "31 Weeks", "ninety": "56 Weeks"}',
        '{"surgery": "Open Heart Bypass", "doctor": "Dr. Fraser River", "hospital":"Vancouver General Hospital", "median": "41 Weeks", "ninety": "62 Weeks"}',
        '{"surgery": "Brain Surgery", "doctor": "Dr. Bo Down", "hospital":"Burnaby General Hospital", "median": "41 Weeks", "ninety": "51 Weeks"}',
        '{"surgery": "ACL Surgery", "doctor": "Dr. Wendy Wu", "hospital":"Vancouver General Hospital", "median": "21 Weeks", "ninety": "39 Weeks"}',
    ]