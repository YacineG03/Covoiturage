import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/service/auth.services';

@Component({
  selector: 'app-gerer-reservation',
  templateUrl: './gerer-reservation.component.html',
  styleUrls: ['./gerer-reservation.component.scss']
})
export class GererReservationComponent implements OnInit {
  reservations: any[] = [];

  constructor(private reservationService: AuthService) {}

  ngOnInit(): void {
    this.loadReservations();
  }
  loadReservations(): void {
    const email = this.reservationService.getUserEmail();
    console.log(`Chargement des réservations pour l'email: ${email}`);
  
    this.reservationService.getReservationsWithDetails(email).subscribe(
      (reservations) => {
        console.log('Réservations reçues:', reservations);
        this.reservations = reservations;
        console.log('Nombre de réservations:', this.reservations.length); // Vérifie le nombre de réservations reçues
      },
      (error) => {
        console.error('Erreur lors du chargement des réservations:', error);
      }
    );
  }
  
}
