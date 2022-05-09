importScripts("https://www.gstatic.com/firebasejs/9.8.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/9.8.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: 'AIzaSyALQsK3VSz1_R9x8TJmw6uO7lwqRyhAJTs',
    appId: '1:272148621093:web:21e6054d9a5e31e7e95ccc',
    messagingSenderId: '272148621093',
    projectId: 'smile-front',
    authDomain: 'smile-front.firebaseapp.com',
    storageBucket: 'smile-front.appspot.com',
    measurementId: 'G-7XWJZ0CP9H',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();
