import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class LoginGaurdGuard implements CanActivate {
  constructor(
    public auth:AuthService,
    public router: Router
  ) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot):boolean{
    if (!this.auth.isLoggin()) {
      return true;
    } else {
      this.router.navigate(['/category/home'], {
        queryParams: {
          return: state.url
        }
      });
      return false;
    }
  } 
  
}
