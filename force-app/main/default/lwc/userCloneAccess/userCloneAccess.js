import { LightningElement, wire, track } from 'lwc';
import getActiveUsers from '@salesforce/apex/userCloneController.getActiveUsers';
import getUserAccess from '@salesforce/apex/userCloneController.getUserAccess';
import createUser from '@salesforce/apex/userCloneController.createUser';
import clonePermissions from '@salesforce/apex/userCloneController.clonePermissions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UserCloneAccess extends LightningElement {

    // ---------------- STATE ----------------
    @track userOptions = [];
    sourceUserId;

    accessLoaded = false;
    psCount = 0;
    psgCount = 0;

    clonePS = true;
    clonePSG = true;

    // New user fields
    firstName;
    lastName;
    email;
    username;
    alias;
    //nickname;

    // ---------------- LOAD USERS ----------------
    @wire(getActiveUsers)
    wiredUsers({ data, error }) {
        if (data) {
            this.userOptions = data.map(user => ({
                label: user.Name + ' (' + user.Username + ')',
                value: user.Id
            }));
        }
        if (error) {
            this.showError(error);
        }
    }
    
    // ---------------- SOURCE USER CHANGE ----------------
    handleSourceUserChange(event) {
        this.sourceUserId = event.detail.value;

        getUserAccess({ sourceUserId: this.sourceUserId })
            .then(result => {
                this.psCount = result.permissionSetIds?.length || 0;
                this.psgCount = result.permissionSetGroupIds?.length || 0;
                this.accessLoaded = true;
            })
            .catch(error => this.showError(error));
    }

    // ---------------- CHECKBOXES ----------------
    handleClonePS(event) {
        this.clonePS = event.target.checked;
    }

    handleClonePSG(event) {
        this.clonePSG = event.target.checked;
    }

    // ---------------- FORM HANDLERS ----------------
    handleFirstName(e) { this.firstName = e.target.value;  }
    handleLastName(e) { this.lastName = e.target.value; console.log('LastName set to', this.lastName); }
    handleEmail(e) { this.email = e.target.value; console.log('Email set to', this.email); }
    handleUsername(e) { this.username = e.target.value; console.log('Username set to', this.username);  }
    handleAlias(e) { this.alias = e.target.value; console.log('Alias set to', this.alias);  }
    //handleNickname(e) { this.nickname = e.target.value; }
    
    

    // ---------------- SUBMIT ----------------
    async handleSubmit() {
        if (!this.lastName || !this.email || !this.username || !this.alias) {
                this.showError({ message: 'Please fill all mandatory fields' });
                return;
            }

        console.log(this.lastName, this.email, this.username, this.alias);
        const payload = {     FirstName: this.firstName?.trim() || '',     LastName: this.lastName?.trim() || '',     Email: this.email?.trim() || '',     Username: this.username?.trim() || '',     Alias: this.alias?.trim() || ''   };    
        console.log('payload to Apex', JSON.stringify({ input: payload }));
        try {
            const newUserId = await createUser({
                input: {
                    FirstName: this.firstName,
                    LastName: this.lastName,
                    Email: this.email,
                    Username: this.username,
                    Alias: this.alias,
                    //Nickname: this.nickname
                }
            });

            if (this.clonePS || this.clonePSG) {
                await clonePermissions({
                    sourceUserId: this.sourceUserId,
                    targetUserId: newUserId
                });
            }

            this.showSuccess('User created and access cloned successfully');

        } catch (error) {
            this.showError(error);
        }
        
    }

    // ---------------- TOASTS ----------------
    showSuccess(message) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message,
                variant: 'success'
            })
        );
    }

    showError(error) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: error.body ? error.body.message : error.message,
                variant: 'error'
            })
        );
    }
}