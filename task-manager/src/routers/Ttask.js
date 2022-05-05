const express = require('express')
const TTask = require('../models/Ttask')
const auth1 = require('../middleware/auth1')
const Teacher = require('../models/teacher')
const Task = require('../models/task')
const { count } = require('../models/task')
const User = require('../models/user')
// const { translateAliases } = require('../models/teacher')
const router = new express.Router()


router.post('/taskss', auth1, async (req, res) => {
    const task = new TTask({
        ...req.body,
        owner: req.teacher._id,
        NName: req.teacher.name
        

    })

    try {
        task.Education = "Hey, Tell us About Your Qualifications."
        task.About = "Hi, Tell Us About You :)"
        task.instrument = req.body.instrument
        await task.save()
        res.status(201).send(task)
    } catch (e) {

        res.status(400).send(e)
    }
})

router.get('/Ttasks',auth1, async (req, res) => {
    try {
        await req.teacher.populate('taskss')
        res.send(req.teacher.Ttasks)
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/Ed',auth1, async (req, res) => {
    try {
        const user1 = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(user1.Education)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/ABOU',auth1, async (req, res) => {
    try {
        const user1 = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(user1.About)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/name',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(req.teacher.name)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/email',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
         
          res.status(201).send(req.teacher.email)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/short',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var email= req.teacher.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/STATUSTT',auth1, async (req, res) => {
    try {
        var Temp = [];
        const teacher = await TTask.findOne({owner: req.teacher.id})
        var Students3 = teacher.STUSTATUS
        
           
        res.status(201).send(Students3.toString())

           
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.post('/Ttasks/GetAbout', async(req, res)=>{

    try{
       const about = await TTask.findOne({NName:req.body.NName})
       res.status(200).send(about.About)


    }catch(e){
        res.status(500).send(e)
    }
})

router.post('/Ttasks/CANCEL',auth1, async (req, res) => {
    try {
        const count = await TTask.findOne({owner:req.teacher.id})
         var ccc = count.Students.length
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        const user = await User.findOne({ owner1: req.teacher.id})
          
        const Dateee= await Task.findOne({Name:req.body.Name})
        const dat = Dateee.Date
        const Timee = Dateee.Time
        var TempJ;
        for(var j=0;j<ccc;j++){
            if(req.body.Name==teacher.Students[j]){
                      
               TempJ=j;
               break;
            }
        }
        console.log(TempJ);
        const cancelt = await TTask.findOneAndUpdate({owner:req.teacher._id},
            {
                $push:{
                    CanceledS:req.body.Name,
                    ratingAvgCC:Dateee.rating
                }
            }
            
            )
        cancelt.DateS.splice(TempJ,1)
        cancelt.TimeS.splice(TempJ,1)
        cancelt.ratings.splice(TempJ,1)
        
        cancelt.ratingAvg.splice(TempJ,1)
 
        cancelt.Students.splice(TempJ,1)

       
        
   
         Dateee.Date = "";
         Dateee.Time = "";
         Dateee.instrument = "";
         Dateee.rating=""
         user.owner1 = "";
         Dateee.owner2="";
         await user.save()
      await Dateee.save()
     await teacher.save()
      await cancelt.save()
      res.status(200).send(cancelt)
          
        
    } catch (e) {
        res.status(500).send()
    }
})


router.post('/Ttasks/BookSuccess',auth1, async (req, res) => {
    try {

      const teacher = await TTask.findOneAndUpdate(
        {
            owner: req.teacher.id

     
 },
 {
     $pull: {
    Students : req.body.Students,
    TimeS : req.body.TimeS,
    DateS : req.body.DateS
    
     },
     
 
 
 } 
     )
     const teacher1 = await Task.findOneAndUpdate(
        {
            Time: req.body.Time,
            Date : req.body.Date

     
 },
 {
     $pull: {
    Time : req.body.Time,
    Date : req.body.Date,
    
     },
     
 
 
 } 
     )
     await teacher1.save()
     await teacher.save()
     res.status(200).send(teacher)
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/ListN',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var Students1 = teacher.Students
        
    res.status(201).send(Students1.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ListD',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
 
        var Students3 = teacher.DateS

    res.status(201).send(Students3.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ListS',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var Students2 = teacher.TimeS

    res.status(201).send(Students2.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/count', async (req, res) => {
    try {
        const teacher = await Teacher.count()
                        
           res.send(teacher.toString())
        res.status(201)
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/count1', async (req, res) => {
    try {
        const teacher = await Teacher.findOne({name : "ABOTALAL1"})
                        
        //    res.send(teacher.toString())
        res.status(201).send(teacher)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/TeachersList', async (req, res) => {
    try {
        var Temp = [];
        const teacher = await Teacher.find()
        const teacher1 = await Teacher.count()
        for(var i =0;i<teacher1;i++){
                Temp[i]=teacher[i].name


        }
           


        res.status(200).send(Temp.toString())

           
        
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/CCS',auth1, async (req, res) => {
    try {
        const teacher1 = await TTask.findOne({owner: req.teacher.id})
        var test = teacher1.CanceledS
        var countt = test.length
if(countt==1){
        var Temp = [];
      
    
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    


        res.status(200).send(Temp.toString())
    }
    else if(countt>1){
        var Temp = [];
      
      
        // var split1 = test.split(",")
        //  var count1 = split1.length
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    }
    res.status(200).send(Temp.toString())

           
}
        
     catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ALL',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})


    res.status(200).send(teacher)
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTS',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.Students.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTSC',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.CanceledS.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})


router.get('/Ttasks/INST', async (req, res) => {
    try {
  
        var Temp = [];
        const teacher = await TTask.find()
        const teacher1 = await TTask.count()
        for(var i =0;i<teacher1;i++){
               
            Temp[i]=teacher[i].instrument


        }
           


        res.status(200).send(Temp.toString())

           
        
        
    } catch (e) {
        res.status(500).send()
    }
})

router.patch('/Ttasks/me', auth1, async (req, res) => {
    
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name','About','Education']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

        
    try {
       

        const task = await TTask.findOne({ owner: req.teacher._id})
      
        const Task1 = await Teacher.findIfD(req.body.name)
        if(Task1==false){
            throw new Error()
           
          }

        updates.forEach((update) => req.teacher[update] = req.body[update],
        
        )
        updates.forEach((update) => task[update] = req.body[update],
        
        )
        task.NName=req.body.name
        await task.save()

        await req.teacher.save()
        res.send(task)
        
    } catch (e) {
        res.status(400).send(e)
    }
})



// router.get('/tasks/:id',auth, async (req, res) => {
//     const _id = req.params.id

//     try {
//         const task = await Task.findOne({ _id, owner: req.user._id })

//         if (!task) {
//             return res.status(404).send()
//         }

//         res.send(task)
//     } catch (e) {
//         res.status(500).send()
//     }
// })

// router.patch('/tasks/:id', auth, async (req, res) => {
//     const updates = Object.keys(req.body)
//     const allowedUpdates = ['description', 'completed']
//     const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

//     if (!isValidOperation) {
//         return res.status(400).send({ error: 'Invalid updates!' })
//     }

//     try {
//         const task = await Task.findOne({ _id: req.params.id, owner: req.user._id})

//         if (!task) {
//             return res.status(404).send()
//         }

//         updates.forEach((update) => task[update] = req.body[update])
//         await task.save()
//         res.send(task)
//     } catch (e) {
//         res.status(400).send(e)
//     }
// })

// router.delete('/tasks/:id', auth, async (req, res) => {
//     try {
//         const task = await Task.findOneAndDelete({ _id: req.params.id, owner: req.user._id })

//         if (!task) {
//             res.status(404).send()
//         }

//         res.send(task)
//     } catch (e) {
//         res.status(500).send()
//     }
// })

router.get('/Ttasks/short',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var email= req.teacher.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})



router.post('/Ttasks/COMPS',auth1, async (req, res) => {
    try {
        const count = await TTask.findOne({owner:req.teacher.id})
         var ccc = count.Students.length
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        const user = await User.findOne({ owner1: req.teacher.id})
          
        const Dateee= await Task.findOne({Name:req.body.Name})
        var TempJ;
        for(var j=0;j<ccc;j++){
            if(req.body.Name==teacher.Students[j]){
                      
               TempJ=j;
               break;
            }
        }
        console.log(TempJ);
        const cancelt = await TTask.findOneAndUpdate({owner:req.teacher._id},
            {
                $push:{
                    CompS:req.body.Name
                }
            }
            
            )
        cancelt.DateS.splice(TempJ,1)
        cancelt.TimeS.splice(TempJ,1)
        cancelt.ratings.splice(TempJ,1)
        cancelt.Students.splice(TempJ,1)
    
   
         Dateee.Date = "";
         Dateee.Time = "";
         Dateee.instrument = "";
         Dateee.rating="";
         user.owner1 = "";
         Dateee.owner2="";
         await user.save()
      await Dateee.save()
     await teacher.save()
      await cancelt.save()
      res.status(200).send(cancelt)
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/CCSS',auth1, async (req, res) => {
    try {
        const teacher1 = await TTask.findOne({owner: req.teacher.id})
        var test = teacher1.CompS
        var countt = test.length
if(countt==1){
        var Temp = [];
      
    
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    


        res.status(200).send(Temp.toString())
    }
    else if(countt>1){
        var Temp = [];

         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    }
    res.status(200).send(Temp.toString())

           
}
        
     catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTSCC',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.CompS.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/CountAvg',async (req, res) => {
    try {

        const teacher = await TTask.find()
        var i;
        var j;
        var k;
        var array=0
        var array1=[];
        var sum3=0;
        for(i=0;i<teacher.length;i++){
            if(teacher[i].ratingAvg.length==0){
                if(teacher[i].ratingAvgCC.length==0){
                }

            }
            
            array1[i]=0

           
        }
    
        for(i=0;i<teacher.length;i++){
            if(teacher[i].ratingAvg.length!=0){
                if(teacher[i].ratingAvgCC==0){
                    for(j=0;j<teacher[i].ratingAvg.length;j++){
                     array+=teacher[i].ratingAvg[j]
                    
                    }
                        array1[i]=array
                        array=0;
                    
                }
                else if(teacher[i].ratingAvgCC.length!=0){
                    if(teacher[i].ratingAvg.length>teacher[i].ratingAvgCC.length){
                        for(k=0;k<teacher[i].ratingAvg.length;k++){
                            if(teacher[i].ratingAvgCC[k]==0||teacher[i].ratingAvgCC[k]==""||teacher[i].ratingAvgCC[k]==null){
                                array+=teacher[i].ratingAvg[k]+0
                                array1[i]=array



                            }
                            else{
                            array+=teacher[i].ratingAvg[k]+teacher[i].ratingAvgCC[k]
                            }
                        }
                        array1[i]=array

                        array=0
                    }
                    else if(teacher[i].ratingAvg.length<teacher[i].ratingAvgCC.length){
                        for(k=0;k<teacher[i].ratingAvgCC.length;k++){
                            if(teacher[i].ratingAvg[k]==0||teacher[i].ratingAvg[k]==""||teacher[i].ratingAvg[k]==null){
                                array+=teacher[i].ratingAvgCC[k]
                                array1[i]=array
                            }
                            else{
                            array+=teacher[i].ratingAvg[k]+teacher[i].ratingAvgCC[k]
                            }
                        }
                        array1[i]=array
                        array=0

                    }
                    else{
                        for(k=0;k<teacher[i].ratingAvgCC.length;k++){
                            array+=teacher[i].ratingAvg[k]+teacher[i].ratingAvgCC[k]
                        }
                        array1[i]=array
                        array=0
                    }
                }
            }
            else if(teacher[i].ratingAvg.length==0){
                if(teacher[i].ratingAvgCC.length!=0){
                for(j=0;j<teacher[i].ratingAvgCC.length;j++){
                    array+=teacher[i].ratingAvgCC[j]
                   
                   }

                       array1[i]=array
                       array=0;
                      

            }
        }
        }
        
        var c
        var c1=0
        var Cancel=0
        var Complete = 0
        var sum=0;
        var sum1=0;
        var sum2=0;
        var flag=0;
        var FinalArray =[]
        for(c1=0;c1<teacher.length;c1++){
           sum=teacher[c1].ratingAvgCC.length
           sum1=teacher[c1].ratingAvg.length
           sum2=sum+sum1
             FinalArray[c1]=array1[c1]/sum2

        
        
        }
         var Array1 = []
         var w;
         for(w=0;w<FinalArray.length;w++){

            Array1[w]=FinalArray[w].toFixed(1)
         }

      
    res.status(200).send(Array1.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})


//

router.post('/Ttasks/RESCHD',auth1, async (req, res) => {
    try {
        const user1= await Teacher.findOne({name:req.teacher.name}) 
        const user2 = await Task.findOne({owner2:user1._id})
        const ttassk = await TTask.findOne({owner:req.teacher._id})
             const count = ttassk.Students.length
               var TempJ=0;
             for(var j=0;j<count;j++){
                 if(req.body.Name==ttassk.Students[j]){
                           
                    TempJ=j;
                    break;
                 }
             }
         var i;
         var j;
         var k;
         var q;
         for(i=0;i<count;i++){
             if(req.body.Date==ttassk.DateS[i]||req.body.Date==user2.Date){
             for( j = 0;j<count;j++){
                     

                    if(req.body.Time==ttassk.TimeS[j]||req.body.Time==user2.Time){
                        res.status(404).send("This Date is Already booked!")
                        
                    }        
            }
            user2.Date=req.body.Date
            user2.Time=req.body.Time
            ttassk.DateS[TempJ] = req.body.Date
            ttassk.TimeS[TempJ]=req.body.Time
            await ttassk.save()
            await user2.save()
            res.status(200).send("Date-is-Updated")
        }
    
        }


       user2.Date=req.body.Date
            user2.Time=req.body.Time
            ttassk.DateS[TempJ] = req.body.Date
            ttassk.TimeS[TempJ]=req.body.Time
            await ttassk.save()
            await user2.save()
            res.status(200).send("Date-is-Updated")
        
            
            res.status(200).send(ttassk.About)

        //  res.status(200).send(count.toString())

          
        
    } catch (e) {
        res.status(500).send()
    }
})


//

module.exports = router