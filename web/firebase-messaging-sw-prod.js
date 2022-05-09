importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: 'AIzaSyCYu2e-V5ur4KpXHipKwT8S0QDN13inOq0',
    appId: '1:808053220014:web:b947cddd522649cd5f033f',
    messagingSenderId: '808053220014',
    projectId: 'smile-front-prod',
    authDomain: 'smile-front-prod.firebaseapp.com',
    storageBucket: 'smile-front-prod.appspot.com',
    measurementId: 'G-718LTT1LV3',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();
