from flask import Flask, make_response, request, redirect, url_for, jsonify
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
from PIL import Image
import base64
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import Select
import math
import pandas as pd
import ast


app = Flask(__name__)

def scrape_fun(driver, state_input, city_input, station_input):
    state_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[1]/div/select"))
    time.sleep(2)
    city_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[2]/div/select"))
    time.sleep(2)
    station_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[3]/div/select"))
    time.sleep(2)
    state_dropdown.select_by_visible_text(state_input)
    time.sleep(2)
    city_dropdown.select_by_visible_text(city_input)
    time.sleep(2)
    station_dropdown.select_by_visible_text(station_input)

    time.sleep(7)

    aqi_element = driver.find_elements(By.ID, 'aqi-meter')
    prompoll=driver.find_elements(By.XPATH, "/html/body/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/td/big/span")
    daydate=driver.find_elements(By.XPATH, "/html/body/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[3]/td/big/span")
    space,info=[],[]
    for i in aqi_element:
        info.append(i.text)
        finalaqi=info[0].split('\n')
    aqi=(finalaqi[2])
    aqitag=(finalaqi[1])
    for j in prompoll:
        prom=(j.text)
    for k in daydate:
        space.append(k.text)
    date=(space[0])
    return aqi, aqitag, prom, date




def distance(origin, destination):
    lat1, lon1 = origin
    lat2, lon2 = destination
    radius = 6371 

    dlat = math.radians(lat2-lat1)
    dlon = math.radians(lon2-lon1)
    a = math.sin(dlat/2) * math.sin(dlat/2) + math.cos(math.radians(lat1)) \
        * math.cos(math.radians(lat2)) * math.sin(dlon/2) * math.sin(dlon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    d = radius * c

    return d

def init_driver():
    setting = webdriver.ChromeOptions()
    setting.add_argument("--headless")
    setting.add_argument("disable-infobars")
    setting.add_argument("--disable-extensions")
    setting.add_argument("--disable-dev-shm-usage")
    setting.add_argument("--no-sandbox")
    setting.add_argument("--remote-debugging-port=9222")
    driver = webdriver.Chrome(chrome_options=setting)
    return driver

global driver
driver = init_driver()

@app.route("/closest-location/<float:lat>/<float:long>", methods=["GET"])
def closest_location(lat,long):
    origin = (lat,long)
    df = pd.read_excel('C:/src/projects/App/homePage/homepage/lib/src/NavigationPages/homePage/backEnd/AQIstations.xlsx')
    coord,dist=[],[]

    for index, row in df.iterrows():
        destinations = ast.literal_eval(row['lat_long'])
        coord.append((destinations[0],destinations[1]))

    for i in coord:
        dist.append(distance(origin, i))

    min_dist = min(dist)
    min_index = dist.index(min_dist)
    state_input = df.iloc[min_index]['State']
    city_input = df.iloc[min_index]['City']
    station_input = df.iloc[min_index]['Station Name']

    state_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[1]/div/select"))
    time.sleep(2)
    city_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[2]/div/select"))
    time.sleep(2)
    station_dropdown = Select(driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[1]/div[3]/div/select"))
    time.sleep(2)
    state_dropdown.select_by_visible_text(state_input)
    time.sleep(2)
    city_dropdown.select_by_visible_text(city_input)
    time.sleep(2)
    station_dropdown.select_by_visible_text(station_input)

    time.sleep(7)

    aqi_element = driver.find_elements(By.ID, 'aqi-meter')
    prompoll=driver.find_elements(By.XPATH, "/html/body/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/td/big/span")
    daydate=driver.find_elements(By.XPATH, "/html/body/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[3]/td/big/span")
    space,info=[],[]
    for i in aqi_element:
        info.append(i.text)
        finalaqi=info[0].split('\n')
    aqi=(finalaqi[2])
    aqitag=(finalaqi[1])
    for j in prompoll:
        prom=(j.text)
    for k in daydate:
        space.append(k.text)
    date=(space[0])
    return jsonify({"State":state_input, "City":city_input, "Station":station_input, "AQI": aqi, "AQITAG": aqitag, "Prominent Pollutant": prom, "Date": date})


@app.route("/scrape-image", methods=["GET"])
def scrape_image():
    driver.get("https://app.cpcbccr.com/AQI_India/")
    captcha = driver.find_element(By.XPATH, "/html/body/div[7]/div/div/div[2]/div[1]/img")
    captcha_url = captcha.get_attribute("src")
    image_data = base64.b64decode(captcha_url.split(',')[1])
    response = make_response(image_data)
    response.headers.set('Content-Type', 'image/png')
    response.headers.set('Content-Disposition', 'attachment', filename='captcha.png')
    return response

@app.route("/submit-captcha/<captcha>", methods=["GET"])
def submit_captcha(captcha):
    submit_button = driver.find_element(By.XPATH, "/html/body/div[7]/div/div/div[3]/button[2]")
    captcha_input_field=driver.find_element(By.XPATH, "/html/body/div[7]/div/div/div[2]/input")
    captcha_input_field.send_keys(captcha)
    submit_button.click()
    return redirect(url_for("submit_captcha_success"))

@app.route("/submit-captcha-success", methods=["GET"])
def submit_captcha_success():
    return "Captcha input submitted successfully!"
    


