import nodemailer from "nodemailer";
export const transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 465,
    secure: true, // true for port 465, false for other ports
    auth: {
      user: "jddca874@gmail.com",
      pass: "ngxd itko puak trfc",
    },
  });

  transporter.verify().then(()=>{
    console.log('Ready for send emails');
  })