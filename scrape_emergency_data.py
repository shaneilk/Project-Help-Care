import json
from bs4 import BeautifulSoup
from emergency_data import EmergencyData
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options

def get_hospital_name(row):
    for name_div in row.find_all('div', {'class': 'CellfcW2'}):
        for name_string in name_div.find_all('p'):
            return name_string.text
        
def get_wait_time(row):
    for wait_time_div in row.find_all('div', {'class', 'Cell'}):
        for wait_time_string in wait_time_div.find_all('p'):
            return wait_time_string.text 

def get_length_of_stay_time(row):
    for length_of_stay_div in row.find_all('div', {'class', 'Cell'}):
        for length_of_stay_string in length_of_stay_div.find_all('p'):
            return length_of_stay_string.text
        
def create_emergency_data_object(row):
    hospital_name = get_hospital_name(row)
    wait_time = get_wait_time(row)
    length_of_stay = get_length_of_stay_time(row)
    return EmergencyData(hospital_name, wait_time, length_of_stay)


def get_emergency_data():
    # URL to scrape
    url = 'http://www.edwaittimes.ca/WaitTimes.aspx'

    chrome_options = Options()  
    chrome_options.add_argument("--headless")

    # Send a GET request to the URL
    with Chrome(options=chrome_options) as browser:
        browser.get(url)
        html = browser.page_source

        soup = BeautifulSoup(html, 'html.parser')

        # Extract information from the page
        hospital_data = []
        for tag in soup.find_all('a'):
            for div in tag.find_all('div', {'class': 'TableW'}):
                for row in div.find_all('div', {'class': 'Row'}):
                    hospital_data.append(json.dumps(create_emergency_data_object(row).__dict__))

        print(hospital_data)
        return hospital_data


if __name__ == '__main__':
    get_emergency_data()
                    