import fetch from 'isomorphic-fetch';
import Config from '../../server/config';

// export const API_URL = (typeof window === 'undefined' || process.env.NODE_ENV === 'test') ?
//   process.env.BASE_URL || (`http://localhost:${process.env.PORT || Config.port}/api`) :
//   '/api';
const apiPort = 28851;
const javaApiPort = 8080;
export const API_URL = `http://localhost:${apiPort}/api`;
export const JAVA_API_URL = `http://localhost:${javaApiPort}/api`;

export default function callApi(endpoint, method = 'get', body) {
  let token = null;
  if(localStorage) {
    token = localStorage.getItem("token");
  }
  return fetch(`${API_URL}/${endpoint}`, {
    headers: {
      'content-type': 'application/json',
      'authorization': "Bearer " + token
    },
    method,
    body: JSON.stringify(body),
  })
  .then(response => response.json().then(json => ({ json, response })))
  .then(({ json, response }) => {
    if (!response.ok) {
      return Promise.reject(json);
    }

    return json;
  })
  .then(
    response => response,
    error => error
  );
}
export function callJavaApi(endpoint, method = 'get', body) {
  let token = null;
  if(localStorage) {
    token = localStorage.getItem("token");
  }
  return fetch(`${JAVA_API_URL}/${endpoint}`, {
    headers: {
      'content-type': 'application/json',
      'authorization': token
    },
    method,
    body: JSON.stringify(body),
  })
  .then(response => response.json().then(json => ({ json, response })))
  .then(({ json, response }) => {
    if (!response.ok) {
      return Promise.reject(json);
    }

    return json;
  })
  .then(
    response => response,
    error => error
  );
}
