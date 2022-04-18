const mongoose = require('mongoose')

const taskSchema = new mongoose.Schema({
    About: {
        type: String,
        trim: true
    },
    Education: {
        type: String,
        trim: true
    },
    instrument:{
        type: String,
        required:false,
        trim:true
    },
    Name: {
        type:String,
        unique:true,
        required:false

    },
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
    },
 
    Time:{
      type: String,
      required:false,
      trim:true

    },
    owner2:{
        type: mongoose.Schema.Types.String,
        required: false,
        ref: 'Teacher'
    },
   
    Date:{
        type:String,
        required:false,
        trim:true
    }


}, {
    timestamps: true
})
// taskSchema.statics.FindEd = async (id)=>{
//     const user =await Task.findOne({_id:id})
    
//     console.log(user.Educatior)

    
//     }

const Task = mongoose.model('Task', taskSchema)

module.exports = Task