import random
import colorama
import requests

from bs4 import BeautifulSoup

colorama.init()

# Function to fetch cameras from insecam.org
def get_cameras(country, city):
    url = f"http://www.insecam.org/en/bycountry/{country}/{city}/"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0;Win64) AppleWebkit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
    }

    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, 'html.parser')

    # Extract camera information
    cameras = soup.find_all('div', {'class': 'thumbnail-item'})
    for camera in cameras:
        link = camera.find('a')['href']
        # Extract other information about the camera
        # ...
        print(f"Camera link: {link}")
        # Print other camera information
        # ...


# Function to fetch location information from whatsmyipaddress.com
def get_location_info():
    url = "https://www.whatsmyipaddress.com/"

    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    # Extract location information
    # ...
    # Extract latitude and longitude
    # ...


# Function to display latitude and longitude in Google Maps
def display_google_maps(latitude, longitude):
    url = f"https://www.google.com/maps/place/{latitude},{longitude}"

    # Open the URL in a web browser or do further processing


# Main function to run the tool
def main():
    print(colorama.Fore.GREEN + "Welcome to God's Eye!" + colorama.Fore.RESET)
    # Prompt user for country and city input
    country = input("Enter the country: ")
    city = input("Enter the city: ")

    # Call the function to fetch cameras
    get_cameras(country, city)

    # Call the function to fetch location information
    location_info = get_location_info()

    # Extract latitude and longitude from location information
    latitude = location_info['latitude']
    longitude = location_info['longitude']

    # Call the function to display latitude and longitude in Google Maps
    display_google_maps(latitude, longitude)


if __name__ == '__main__':
    main()
