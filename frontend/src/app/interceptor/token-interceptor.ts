import { Injectable, Injector } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {
    constructor(
        public injector:Injector,
        public authService:AuthService
    ) { }
    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        // let authService = this.injector.get(AuthService);
        let token = this.authService.getToken();

        request = request.clone({
            setHeaders: {
                // Authorization: `bearer ${authService.getToken()}`
                Authorization: `bearer ${token}`
            }
        });
        return next.handle(request);
    }
}
