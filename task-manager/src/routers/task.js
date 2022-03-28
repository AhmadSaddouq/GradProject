const express = require('express')
const Task = require('../models/task')

const auth = require('../middleware/auth')
const User = require('../models/user')

const router = new express.Router()

router.post('/tasks', auth, async (req, res) => {
    const task = new Task({
        ...req.body,
        owner: req.user._id
    })

    try {
        task.Education = "Hey, Tell us About Your Qualifications."
        task.About = "Hi, Tell Us About You :)"
        await task.save()
        res.status(201).send(task)
    } catch (e) {
        res.status(400).send(e)
    }
})

router.get('/tasks',auth, async (req, res) => {
    try {
        await req.user.populate('tasks')
        res.send(req.user.tasks)
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/tasks/Ed',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
         

          res.status(201).send(user1.Education)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/ABOU',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
         

          res.status(201).send(user1.About)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/name',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
         

          res.status(201).send(req.user.name)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/email',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
         
          res.status(201).send(req.user.email)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/short',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
        var email= req.user.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.patch('/tasks/me', auth, async (req, res) => {
    
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name','About','Education']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
    
        
    try {
        const task = await Task.findOne({ owner: req.user._id})

        updates.forEach((update) => req.user[update] = req.body[update],
        
        )
        updates.forEach((update) => task[update] = req.body[update],
        
        )
        await task.save()

        await req.user.save()
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

module.exports = router