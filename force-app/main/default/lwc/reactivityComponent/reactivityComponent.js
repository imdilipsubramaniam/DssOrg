import { LightningElement, track } from 'lwc';
import logo from '@salesforce/resourceUrl/trailhead_icon_160x160';

export default class ReactivityComponent extends LightningElement {
    userAddress = "123 Main St, Anytown, USA";

    src = logo;

    @track userDetails = [{
        "userId": "U12345",
        "name": {
            "firstName": "Arjun",
            "lastName": "Mehta"
        },
        "contact": {
            "email": "arjun.mehta@example.com",
            "phone": "+91-9876543210",
            "address": "12 MG Road, Bangalore, Karnataka, India"
        },
        "preferences": {
            "language": "English",
            "timezone": "Asia/Kolkata"
        },
        "employment": {
            "company": "TechNova Solutions",
            "role": "Software Engineer"
        },
        "activityLog": [
            {
                "timestamp": "2026-03-28T14:32:00",
                "action": "login"
            },
            {
                "timestamp": "2026-03-28T15:10:00",
                "action": "update_profile"
            }
        ],
        "security": {
            "twoFactorAuth": true,
            "lastPasswordChange": "2026-02-15"
        }
    }];

    handleClick() {
        this.userAddress = '456 Elm St, Othertown, USA';
        this.userDetails[0].userId = "78945";
        this.userDetails[0].name.firstName = "Dilip";
        this.userDetails[0].activityLog[1].action = "Modified by Dilip";
    }

    handleChange(event) {
        this.userAddress = event.target.value;
    }


}