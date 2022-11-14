import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

import {environment} from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ServersService {

  private apiServer =  `${environment.path}/server`;

  private httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
    observe: 'response' as 'response'
  };

  constructor(private httpClient: HttpClient) { }

  /**
   * list server record
   * @param page for pagination
   * @param search for query param
   */
  list(page: number, search: string): Observable<any> {
    const url = `${this.apiServer}/list?page=${page}${search}&expand=serverLocation`;
    return this.httpClient.get(url, this.httpOptions)
      .pipe(
        catchError(this.errorHandler)
      );
  }

  /**
   * handle error
   * @param error pass error handle
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
