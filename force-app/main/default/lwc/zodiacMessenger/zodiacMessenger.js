import { LightningElement } from 'lwc';


export default class ZodiacMessenger extends LightningElement {
    zodiacSigns = [
        {
            sign: "Aries",
            from: "03-21",
            to: "04-19",
            emoji: "♈",
            trait: "Bold and energetic, Aries love to take initiative. Natural leaders who thrive on challenges."
        },
        {
            sign: "Taurus",
            from: "04-20",
            to: "05-20",
            emoji: "♉",
            trait: "Grounded and reliable, Taurus values stability. They enjoy comfort, beauty, and loyalty."
        },
        {
            sign: "Gemini",
            from: "05-21",
            to: "06-20",
            emoji: "♊",
            trait: "Curious and adaptable, Geminis are great communicators. They thrive on variety and new ideas."
        },
        {
            sign: "Cancer",
            from: "06-21",
            to: "07-22",
            emoji: "♋",
            trait: "Sensitive and nurturing, Cancer values home and family. Deeply intuitive and protective."
        },
        {
            sign: "Leo",
            from: "07-23",
            to: "08-22",
            emoji: "♌",
            trait: "Confident and charismatic, Leos shine in the spotlight. Warm‑hearted and creative."
        },
        {
            sign: "Virgo",
            from: "08-23",
            to: "09-22",
            emoji: "♍",
            trait: "Detail‑oriented and practical, Virgos love to help. Analytical thinkers with a caring nature."
        },
        {
            sign: "Libra",
            from: "09-23",
            to: "10-22",
            emoji: "♎",
            trait: "Balanced and diplomatic, Libras value harmony. Lovers of beauty, fairness, and connection."
        },
        {
            sign: "Scorpio",
            from: "10-23",
            to: "11-21",
            emoji: "♏",
            trait: "Passionate and intense, Scorpios seek depth. Loyal, mysterious, and transformative."
        },
        {
            sign: "Sagittarius",
            from: "11-22",
            to: "12-21",
            emoji: "♐",
            trait: "Adventurous and optimistic, Sagittarians love freedom. Philosophical explorers of life."
        },
        {
            sign: "Capricorn",
            from: "12-22",
            to: "01-19",
            emoji: "♑",
            trait: "Ambitious and disciplined, Capricorns value hard work. Practical dreamers with strong willpower."
        },
        {
            sign: "Aquarius",
            from: "01-20",
            to: "02-18",
            emoji: "♒",
            trait: "Innovative and independent, Aquarians think ahead. Humanitarian visionaries with unique ideas."
        },
        {
            sign: "Pisces",
            from: "02-19",
            to: "03-20",
            emoji: "♓",
            trait: "Compassionate and imaginative, Pisces are dreamers. Deeply empathetic and artistic souls."
        }
    ]

    name;
    dob;

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handleDobChange(event) {
        this.dob = event.target.value;
    }

    handleClick() {

        if (this.name && this.dob) {
            console.log(this.name);
            console.log(this.dob);

            const userbirthDate = new Date(this.dob);
            const birthMonth = userbirthDate.getMonth() + 1;
            const birthDate = userbirthDate.getDate();

            console.log(birthDate);
            console.log(birthMonth);
            this.checkZodiacSign(birthMonth, birthDate);
        }
    }
        //name and dob . map dob to the right dob in the list

        checkZodiacSign(birthMonth, birthDate){
            //have month date separe - list.from and to -for(and loop from and to then check if it is in between or equal)
            //10/09
            console.log('inside checker' + birthDate,birthMonth);   
            for (const sign of this.zodiacSigns) {
               console.log(sign);
            }
        }
    


}