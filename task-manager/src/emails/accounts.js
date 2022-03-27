const sgMail = require('@sendgrid/mail')

const sendgridAPIKey = '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'

sgMail.setApiKey(sendgridAPIKey)

const sendWelcomeEmail = (email, name, Verify) => {
    sgMail.send({
        to : email,
        from : 's11819625@stu.najah.edu',
        subject : 'Thanks for joining in!',
        text : `Hi ${name}, Please confirm your account using this ${Verify} number`

    })
}


module.exports = {
    sendWelcomeEmail
}