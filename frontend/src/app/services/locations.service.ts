import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LocationsService {

  private apiServer =  `${environment.path}/location`;

  private httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
    observe: 'response' as 'response'
  };

  constructor(private httpClient: HttpClient) { }

  /**
   * list record
   * @param page for pagination
   */
  list(page: number): Observable<any> {
    return this.httpClient.get(`${this.apiServer}/list?page=${page}`, this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      );
  }

  /**
   * list all record
   */
  listAll(): Observable<any> {
    return this.httpClient.get(`${this.apiServer}/list-all`, this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      );
  }

  /**
   * handle error message
   * @param error to pass err
   */
  errorHandler(error) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      errorMessage = error.error.message;
    } else {
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    return throwError(errorMessage);
  }
}
