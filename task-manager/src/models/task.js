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
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
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