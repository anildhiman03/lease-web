import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from "@angular/common/http";
import { environment } from './../../environments/environment';

import {Observable, throwError} from 'rxjs';
import { catchError } from 'rxjs/operators';

// import { ApiResponse } from './category';
import {ApiResponse} from "../models/api.response";

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  private apiServer =  environment.path + "food_category";
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };
  constructor(private httpClient: HttpClient) { }

  create(product): Observable<ApiResponse> {
    return this.httpClient.post<ApiResponse>(this.apiServer + '/', JSON.stringify(product), this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      )
  }
  getById(id): Observable<ApiResponse> {
    return this.httpClient.get<ApiResponse>(this.apiServer + '/' + id)
      .pipe(
        catchError(this.errorHandler)
      )
  }

  getAll(page:number): Observable<ApiResponse> {
    let url = this.apiServer + '/?page='+page+'&limit=10';
    return this.httpClient.get<ApiResponse>(url)
      .pipe(
        catchError(this.errorHandler)
      )
  }

  listAll(page:number = 1): Observable<ApiResponse> {
    let url = this.apiServer + '/?page='+page+'&limit=1000';
    return this.httpClient.get<ApiResponse>(url)
      .pipe(
        catchError(this.errorHandler)
      )
  }

  update(id, product): Observable<ApiResponse> {
    return this.httpClient.put<ApiResponse>(this.apiServer + '/' + id, JSON.stringify(product), this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      )
  }

  delete(id){
    return this.httpClient.delete<ApiResponse>(this.apiServer + '/' + id, this.httpOptions)
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
}
