import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from "@angular/common/http";
import { environment } from './../../environments/environment';

import {Observable, throwError} from 'rxjs';
import { catchError } from 'rxjs/operators';

// import { ApiResponse } from './category';
import {ApiResponse} from "../models/api.response";
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private apiServer =  environment.path+"users";
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };
  constructor(
    private httpClient: HttpClient,
    public _router: Router
    ) { }

  login(user): Observable<ApiResponse> {
    return this.httpClient.post<ApiResponse>(this.apiServer + '/login', JSON.stringify(user), this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      )
  }

  errorHandler(error) {
    let errorMessage = '';
    if(error.error instanceof ErrorEvent) {
      // Get client-side error
      errorMessage = error.error.message;
    } else {
      // Get server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.log(errorMessage);
    return throwError(errorMessage);
  }

  
  isLoggin() {
    if (localStorage.getItem('token')) {
      return true;
    } else {
      return false;
    }
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('first_name');
    localStorage.removeItem('last_name');
    localStorage.removeItem('user_type');
    localStorage.removeItem('email');
    this._router.navigate(['/login'])
  }

  
  getToken() {
    return localStorage.getItem('token');
  }
}
