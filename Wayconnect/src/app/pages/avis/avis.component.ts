import { Component } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-avis-form',
  templateUrl: './avis.component.html',
  styleUrls: ['./avis.component.scss']
})
export class AvisComponent {
  avis = {
    rating: null,
    comment: '',
    userId: null
  };

  constructor() {}

  submitForm() {
    // Simulate submission success after a delay (example: 1 second)
    setTimeout(() => {
      // Show success message using Swal
      Swal.fire({
        icon: 'success',
        title: 'Avis enregistré!',
        text: 'Votre avis a bien été enregistré.',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK'
      });

      // Reset form or perform other actions after successful submission
      this.resetForm();
    }, 1000); // Simulated delay of 1 second
  }

  resetForm() {
    // Reset form fields
    this.avis.rating = null;
    this.avis.comment = '';
    this.avis.userId = null;
  }
}
