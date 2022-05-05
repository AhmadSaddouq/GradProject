const mongoose = require('mongoose')
const validator = require('validator')

const jwt = require('jsonwebtoken')

const bcrypt = require('bcrypt')
const TTask = require('./Ttask')
const {deletemmany} = require('../Functions')
const userSchema1 = new mongoose.Schema({ 
  
    Phone:{
    type : String,
    unique:true,
    required: false,
    trim: true,
    minlength: 10,
    validate(value){
     if(validator.equals(value,"")){
      throw new Error("Please fill up the number field!")
     }
  
    }
    },
    Salary:{
     type: String,
     required:true,
     trim:true
    },
    Gender:{
        type: String,
        required: false,
        trim:true
          
    },
    
  
      name: {
          type: String,
          unique:true,
          required: true,
          trim: true,
          minlength:5,
          
          
      },
   
      email: {
          type: String,
          required: true,
          trim: true,
          unique: true,
          lowercase: true,
          validate(value) {
              if (!validator.isEmail(value)) {
                  throw new Error('Email is invalid')
              }
          }
      },
      birthday:{
          type: String,
          required: false,
          trim:true,
          validate(value){
  if(!validator.isDate(value)){
   throw new Error('Date Is Invalid')
  }
          }
  
      },
  
      password: {
          type: String,
          required: true,
          minlength: 7,
          trim: true,
          validate(value) {
              if (value.toLowerCase().includes('password')) {
                  throw new Error('Password cannot contain "password"')
              }
          }
      },
      Tries: {
       type : Number

      },
    

      tokens: [{
        token: {
            type: String,
            required: true
        }
    }],
    Pin: {
        type: String,
        required: false,
        trim: true
    },
  },
    

 
  {
    timestamps: true
})
  userSchema1.virtual('taskss', {
      
    ref: 'TTask',
    localField: '_id',
    foreignField: 'owner'
})
userSchema1.virtual('UserTask', {
      
    ref: 'User',
    localField:'_id',
    foreignField: 'owner1'
})

userSchema1.virtual('UserTaskk', {
      
    ref: 'Task',
    localField:'_id',
    foreignField: 'owner2'
})
userSchema1.statics.findIfD = async (name)=>{
    const User = require('./user')

    const user = await User.findOne({name:name})
    if(user){
        console.log(user)

        return false
    }
  return true
   
    
    }

userSchema1.statics.findUser1 = async (name, password)=>{
    const teacher = await Teacher.findOne({name})
    if(!teacher){
        throw new Error('Unable to login!')
    }
    const isMatch1 = await bcrypt.compare(password,teacher.password)
    if(!isMatch1){
        throw new Error('Unable to login!')
    }
    return teacher
}
userSchema1.pre('save', async function(next){
    const teacher = this
    if(teacher.isModified('password')){
        teacher.password = await bcrypt.hash(teacher.password,8)
    
    }
    next()
      })
     
  
userSchema1.methods.generateAuthToken1= async function (){
    const teacher = this
    const token = jwt.sign({_id:teacher.id.toString()},"thisismynewcourse")

    teacher.tokens = teacher.tokens.concat({token})
    
    await teacher.save()
        console.log(teacher._id)
    return token


}
userSchema1.pre('remove', async function (next) {

    const teacher = this
    
    await TTask.deleteMany({ owner: teacher._id })
     

    next()

})

const Teacher = mongoose.model('Teacher', userSchema1)

module.exports = Teacher