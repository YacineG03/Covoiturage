import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../service/auth.services'; // Assurez-vous du chemin correct vers votre service Auth

@Component({
  selector: 'app-info-passager',
  templateUrl: './mes-infos.component.html',
  styleUrls: ['./mes-infos.component.scss'],
})
export class MesInfosComponent implements OnInit {
  passenger: any = {}; // Structure des données du passager

  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.loadPassengerData();
  }

  loadPassengerData() {
    // Exemple de récupération des informations du passager depuis le service Auth
    this.authService.getInfoPassager().subscribe((data: any) => {
      this.passenger = data; // Affectation des données récupérées à l'objet passenger
    });
  }

  editEmail() {
    // Logique pour activer l'édition de l'e-mail
    // Par exemple, vous pouvez activer le champ d'entrée pour l'édition
  }

  editPhone() {
    // Logique pour activer l'édition du numéro de téléphone
  }

  editAddress() {
    // Logique pour activer l'édition de l'adresse
  }

  editPassword() {
    // Logique pour activer l'édition du mot de passe
  }

  submitForm() {
    // Logique pour soumettre les données mises à jour du passager
    this.authService.updatePassenger(this.passenger).subscribe(() => {
      console.log('Données du passager mises à jour avec succès !');
      // Vous pouvez ajouter d'autres logiques selon les besoins après la mise à jour
    });
  }
}
