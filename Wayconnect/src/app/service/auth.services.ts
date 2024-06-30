import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, switchMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private baseURL = "http://localhost:5000"; 

  private userEmail: string;

  constructor(private http: HttpClient) {
    this.userEmail = localStorage.getItem('email') || '';
  }

  getUserEmail(): string {
    return this.userEmail;
  }

  setUserEmail(email: string): void {
    this.userEmail = email;
    localStorage.setItem('email', email);
  }
  
  createReservation(email: string, courseId:number): Observable<any> {
    const body = { email: email, courseId: courseId };
    return this.http.post(`${this.baseURL}/rechercher-course/reserver`,  body );
  }

  getReservationsWithDetails(email: string, courseId?: number): Observable<any> {
    email =this.getUserEmail();
    let params = new HttpParams().set('email', email);
    if (courseId) {
      params = params.set('courseId', courseId.toString());
    }
    console.log(`Appel API avec les paramètres: ${params.toString()}`);

    return this.http.get<any[]>(`${this.baseURL}/gerer-reservation/details`, { params });
  }
  onLogin(obj: any): Observable<any> {
    return this.http.post(`${this.baseURL}/auth/login`, obj);
  }

  createEnregistrerCourse(payload: any): Observable<any> {
    return this.http.post(`${this.baseURL}/enregistrer-course`, payload);
  }

  createPieceIdentite(obj: any): Observable<any> {
    return this.http.post(`${this.baseURL}/piece-identite`, obj);
  }

  createContacterPassager(obj: any): Observable<any> {
    return this.http.post(`${this.baseURL}/contacter-passager`, obj);
  }

  getListeDesPassagers(): Observable<any> {
    return this.http.get(`${this.baseURL}/liste-des-passagers`);
  }

  getMesCourses(): Observable<any> {
    return this.http.get(`${this.baseURL}/mes-courses`);
  }

  getMesCoursesByEmail(email: string): Observable<any> {
    const params = new HttpParams().set('email', email);
    return this.http.get(`${this.baseURL}/mes-courses`, { params });
  }

  getInfoPassager(): Observable<any> {
    return this.http.get(`${this.baseURL}/info-passager`); // Endpoint pour récupérer les informations utilisateur
  }

  updatePassenger(passengerData: any): Observable<any> {
    return this.http.put(`${this.baseURL}/update-passenger`, passengerData);
    // Assurez-vous que l'endpoint 'update-passenger' correspond à votre API backend
  }

  rechercherCourses(formData: any): Observable<any[]> {
    let params = new HttpParams()
      .set('depart', formData.depart)
      .set('arrivee', formData.arrivee);

    console.log('Params envoyés:', params.toString());
    return this.http.get<any[]>(`${this.baseURL}/rechercher-course`, { params });
  }
}


export class Login {
  email: string;
  password: string;
  originType: string;
  constructor() {
    this.email = '';
    this.password = '';
    this.originType = "roles";
  }
}
