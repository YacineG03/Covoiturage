import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from 'src/app/service/auth.services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-rechercher-course',
  templateUrl: './rechercher-course.component.html',
  styleUrls: ['./rechercher-course.component.scss']
})
export class RechercherCourseComponent implements OnInit {
  formGroup: FormGroup;
  coursesDisponibles: any[] = [];
  message: string | null = null;

  constructor(private fb: FormBuilder, public authService: AuthService) {
    this.formGroup = this.fb.group({
      depart: ['', Validators.required],
      arrivee: ['', Validators.required],
    });
  }

  ngOnInit(): void {}

  rechercherCourses(): void {
    if (this.formGroup.valid) {
      const formData = this.formGroup.value;

      this.authService.rechercherCourses(formData).subscribe(
        (response: any[]) => {
          if (response.length > 0) {
            this.coursesDisponibles = response;
            this.message = `Nous avons trouvé ${response.length} courses pour vos critères de recherche.`;
            Swal.fire({
              icon: 'success',
              title: 'Courses trouvées',
              text: this.message
            });
          } else {
            this.coursesDisponibles = [];
            this.message = 'Aucune course disponible pour les critères de recherche spécifiés.';
            Swal.fire({
              icon: 'info',
              title: 'Aucune course disponible',
              text: this.message
            });
          }
        },
        (error) => {
          console.error('Erreur lors de la recherche de courses:', error);
          this.message = 'Une erreur s\'est produite lors de la recherche de courses. Veuillez réessayer plus tard.';
          Swal.fire({
            icon: 'error',
            title: 'Erreur',
            text: this.message
          });
        }
      );
    } else {
      this.message = 'Veuillez remplir correctement tous les champs du formulaire.';
      Swal.fire({
        icon: 'error',
        title: 'Formulaire invalide',
        text: this.message
      });
    }
  }

  faireReservation(email: string,courseId: number): void {
    email = this.authService.getUserEmail();
    console.log(email);
    console.log('l\'id est',courseId)
    this.authService.createReservation(email,courseId).subscribe(
      (response) => {
        console.log('Réservation créée avec succès : ', response);
        Swal.fire({
          icon: 'success',
          title: 'Réservation effectuée',
          text: 'Votre réservation a été effectuée avec succès.'
        });

        // Mettez à jour l'interface utilisateur ou faites d'autres actions nécessaires ici
      },
      (error) => {
        console.error('Erreur lors de la création de la réservation : ', error);
        Swal.fire({
          icon: 'error',
          title: 'Erreur',
          text: 'Une erreur est survenue lors de la réservation. Veuillez réessayer.'
        });
        // Gérer les erreurs de création de réservation ici
      }
    );
  }

  clearForm(): void {
    this.formGroup.reset();
    this.coursesDisponibles = [];
    this.message = null;
  }
}
