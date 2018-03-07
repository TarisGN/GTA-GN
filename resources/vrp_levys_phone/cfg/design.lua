cfg = {}

-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
cfg.phone = [[
.menu{ 
  background-image: url(nui://vrp_levys_phone/gui/img/phonegn.jpg); /*Change the phone wallpaper here. You can use 'grey.jpg' 'red.jpg' 'code.jpg' 'blue.jpg' or add you own in gui/img/--> [Make sure to resize the pic so that the hight is 401px!] */
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf); 
  background-size: cover;
  color: white;
  width: 200px;
  height: 401px;
  font-size: 9px;
  text-align: center;
  margin-left: 60%;
  margin-top: 30%;
  position: absolute;
  float: left;
  border-style: solid; 
  border-width: 30px 9px 30px 9px; 
  border-image: url(nui://vrp_levys_phone/gui/img/menu.png) 30 9 30 9;
  border-radius: 32px;
  box-shadow: -1px -1px 60px -1px rgba(0,0,0,1);
  cursor: pointer;
}

.menu_description{
  border-radius: 0px 0px 4px 4px;
  box-shadow: inset -1px -1px 60px 0px rgba(0,0,0,1);
  box-shadow: -1px -1px 60px 0px rgba(0,0,0,1);
  background-color: rgba(0,0,0,0.5);
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  color: white;
  float: left;
  position: absolute;
  font-weight: bold;
  padding: 9px;
  font-size: 1.2em;
  max-width: 500px;
  max-height: 200px;
}

.menu h1{
  background-color: rgb(44, 189, 247);
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  color: white;
  text-transform: uppercase;
  text-align: center;
  font-size: 1.6em;
  font-weight: bold;
  padding: 6px;
  border: 1px solid #000000;
  box-shadow: inset -1px -1px 60px 0px rgba(0,0,0,1);
}

.choices{
  overflow-y: scroll;
  overflow-x: hidden;
  max-height: 90%;
}

.choices::-webkit-scrollbar{ 
  display: none; 
}

.choices div{
  padding: 8px;
  border: 1px solid #000000;
  font-size: 15px;
  font-weight: bold;
}

.choices .selected{
  background-color: rgba(0, 155, 109,0.75);
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  color: black;
  box-shadow: inset -1px 2px 19px 0px rgba(0,0,0,1);
}

/* progress bar */
.progressbar{
  position: absolute;
}

.progressbar .inner{
}

.progressbar .label{
  position: absolute;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  color: white;
  font-weight: bold;
  text-align: center;
  text-shadow: 2px 2px black;
}

/* wprompt */
.wprompt{
  background-color: #3A3A3A;
  border: 1px solid white;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  box-shadow: 1px 1px 18px 1px #000000;
  color: white;  
  width: 300px;
  height: 200px;
  border-radius: 0px 25px 25px 0px;
  display: flex;
  padding: 5px;
  flex-direction: column;
  cursor: pointer;
}

.wprompt h1{
  font-size: 12px;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
}

.wprompt textarea{
  outline: none !important;
  background-color: rgba(58,58,58,0.75);
  border: 1px solid rgba(255,255,255,0.30);
  box-shadow: inset 1px 1px 18px 1px #000000;
  border-radius: 0px 25px 25px 0px;
  flex: 1;
  color: white;
  width: 100%;
  padding: 12px;
  resize: none;
  box-sizing: border-box;
}

.wprompt textarea:focus{
  outline: none !important;
}

.wprompt .help{
  font-size: 12px;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  padding: 3px;
  text-transform: uppercase;
}

/* request manager */
.request_manager{
  position: absolute;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  bottom: -1px;
  right: 25px;
  text-align: right;
}

.request_manager div{
  margin-bottom: 0px;
}

.request_manager div > span{
  background-color: #3A3A3A;
  border: 1px solid white;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  box-shadow: inset 1px 1px 18px 1px #000000;
  border-radius: 5px 5px 0px 0px;
  font-size: 25px;
  color: white;
  margin-bottom: -1px;
  font-weight: bold;
  padding: 5px;
  text-align: center;
}

.request_manager .yes{
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  padding-left: 15px;
  color: rgb(0,255,0);
  font-size: 1em;
  text-transform: uppercase;
}

.request_manager .no{
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  color: rgb(255,0,0);
  font-size: 1em;
  text-transform: uppercase;
}

/* announce */

.announce{
  position: absolute;
  font-family: 'Roboto';
  src: url(fonts/Roboto-Regular.ttf);
  bottom: 0;
  left: 50%;
  width: 780px;
  height: 130px;
  padding: 10px;
  margin-left: -400px;
  font-weight: bold;
  font-size: 1.1em;
  text-shadow: 2px 2px black;
  color: white;
  display: none;
  opacity: 0.90;
}

]]

return cfg
