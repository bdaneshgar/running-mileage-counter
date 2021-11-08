#include <Arduino.h>


//wifi
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClientSecureBearSSL.h>
#include <ArduinoJson.h>
#include <math.h>
#include <string.h>
const char* ssid     = "ssid";         // The SSID (name) of the Wi-Fi network you want to connect to
const char* password = "password";     // The password of the Wi-Fi network
ESP8266WiFiMulti WiFiMulti;
String access_token = "hi";
void setupWIFI() {
  WiFi.mode(WIFI_STA);
  WiFiMulti.addAP(ssid, password);
}

#define testbit(data,bitno) ((data>>bitno)&0x001)    //Byte manipulation macros
#define bit_set(var,bitno) ((var) |= 1 << (bitno))
#define bit_clr(var,bitno) ((var) &= ~(1 << (bitno)))
 
#define buttonm 12
#define buttonp 11
#define led     13
unsigned int cnt0 = 0;
unsigned int cnt1 = 0;
unsigned long temp = 0;
unsigned char digits[5];
unsigned char old[5];
 
void clearall(void){
   Serial.write((1<<4)|0xF);
      Serial.write((3<<5)|(1<<4)|0xF);
      Serial.write((2<<5)|(1<<4)|0xF);
      delay(1000);
      Serial.write(0xF);
      Serial.write((3<<5)|0xF);
      Serial.write((2<<5)|0xF);
      delay(2000);
}
 
void cleardigit(unsigned char digit){
  unsigned char temp=0;
  mode(0); //put into number mode
  temp=(digit<<5)&(0xF);
  Serial.write(temp);
}
 
void mode(unsigned char mode){
  if(mode==0){Serial.write('0xF1');}else{Serial.write('0xF2');}
}
 
void numwrite(unsigned char address,unsigned char digit,unsigned char value){
  unsigned char temp=0;
  temp=(address<<5)&(digit<<4)&(value);
  Serial.write(temp);
}
 
void segwrite(unsigned char address,unsigned char digit,unsigned char set_clr,unsigned char segment){
  unsigned char temp=0;
  temp=(address<<5)&(digit<<4)&(set_clr<<3)&(segment);
  Serial.write(temp);
}


int milesRun() { //connect to wifi, get miles run from strava api, disconnect from wifi
  if ((WiFiMulti.run() == WL_CONNECTED)) {
    std::unique_ptr<BearSSL::WiFiClientSecure>client(new BearSSL::WiFiClientSecure);
    client->setInsecure();
    HTTPClient https;
    String url = String("https://www.strava.com/api/v3/athletes/21748389/stats?access_token=" + access_token);
    if (https.begin(*client, url)) {  // HTTPS
      int httpCode = https.GET();
      if (httpCode > 0) {
        if (httpCode == HTTP_CODE_OK || httpCode == HTTP_CODE_MOVED_PERMANENTLY) {
          String payload = https.getString();
          const size_t capacity = 6*JSON_OBJECT_SIZE(5) + 3*JSON_OBJECT_SIZE(6) + JSON_OBJECT_SIZE(11) + 840;
          DynamicJsonDocument doc(capacity);
          deserializeJson(doc, https.getString());
          JsonObject all_run_totals = doc["all_run_totals"];
          float all_run_totals_distance = all_run_totals["distance"]; // 5019446
          float m_to_mi = 0.000621371192;
          int result = (int) (all_run_totals_distance * m_to_mi);
          https.end();

         temp=result;

         bool leadingzero = true;
         
         for (int digit = 5; digit >= 0; digit--) {
          if(temp / (int) pow(10, digit) == 0 && leadingzero){
            digits[digit] = 0xF;
          } else {
            digits[digit] = temp / (int) pow(10, digit); //add digit values to run_digits array     
            leadingzero = false;       
          }
          temp = temp%(int) pow(10, digit);
        }
    
    //          2   3   0
    //         _ _ _ _ _ _ 
    
          Serial.write((1<<4)|digits[0]);           //_ _ _ _ _ x
          Serial.write((3<<5)|(1<<4)|digits[2]);    //_ _ _ x _ _
          Serial.write((2<<5)|(1<<4)|digits[4]);    //_ x _ _ _ _
          delay(1000);
          Serial.write(digits[1]);                  //_ _ _ _ x _
          Serial.write((3<<5)|digits[3]);           //_ _ x _ _ _   
          Serial.write((2<<5)|digits[5]);           //x _ _ _ _ _
          delay(1000);
     
          old[5]=digits[5];
          old[4]=digits[4];
          old[3]=digits[3];
          old[2]=digits[2];
          old[1]=digits[1];
          old[0]=digits[0];
          return result;
        } 
      } else {
        return 0; //error check httpCode
      }
      https.end();
    } else {
      return 0; //error unable to connect
    }
  } 
}

 
void setup() {
  Serial.begin(9600);
  delay(5UL*1000UL);   //  Wait 10 seconds
  clearall();
  setupWIFI();
}


void refreshToken(){
  if ((WiFiMulti.run() == WL_CONNECTED)) {
    std::unique_ptr<BearSSL::WiFiClientSecure>client(new BearSSL::WiFiClientSecure);
    client->setInsecure();
    HTTPClient https;
    if (https.begin(*client, "https://www.strava.com/oauth/token")) {  // HTTPS
      int httpCode = https.POST("client_id=CLIENT_ID&client_secret=CLIENT_SECRET&grant_type=refresh_token&refresh_token=REFRESH_TOKEN"); //replace CAPITAL stuff
      if (httpCode > 0) {
        if (httpCode == HTTP_CODE_OK || httpCode == HTTP_CODE_MOVED_PERMANENTLY) {
          String payload = https.getString();
          //https://arduinojson.org/v6/assistant/
          const size_t capacity = JSON_OBJECT_SIZE(6) + JSON_OBJECT_SIZE(18) + 670;
          DynamicJsonDocument doc(capacity);
          deserializeJson(doc, https.getString());
          const char* token = doc["access_token"];
          access_token = String(token);
          https.end();
          return;
        } 
      } else {
        https.end();
      }
      https.end();
    } 
  } 
} 

void loop() {
  refreshToken();   //make sure access token is refreshed
  delay(5UL*1000UL);   //  Wait 10 seconds
  milesRun();
  delay(60UL*60UL*1000UL);   //  Wait 1 hour
}
