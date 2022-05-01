const express = require('express')
require('./db/mongoose')
const jwt = require('jsonwebtoken')
const bcrypt = require("bcrypt")
const userRouter = require('./routers/users')
const taskRouter = require('./routers/task')
const TeacherRouter = require('./routers/Teachers')
const TTASK = require('./routers/Ttask')


const app = express()
const port = process.env.PORT || 3000

app.use(express.json())
app.use(userRouter)
app.use(taskRouter)
app.use(TeacherRouter)
app.use(TTASK)


app.listen(port, ()=>{
console.log('Server is up on port '+ port)
}) 
// const myFunction = async ()=> {
//  const token = jwt.sign({_id:'abc123'},'thisismynewcourse',{expiresIn:'7 days'})
// console.log(token)
// const data = jwt.verify(token, 'thisismynewcourse')
// console.log(data)
// }
// myFunction()
const Task = require('./models/task')
const User = require('./models/user')
const TTask = require('./models/Ttask')
const Teacher = require('./models/teacher')
// const main = async ()=>{
//     const task = await User.findOne({name:"AhmadSadouq1"})

//     await task.populate('owner1')
        
//     console.log(task.owner1.name)

// }

// main()