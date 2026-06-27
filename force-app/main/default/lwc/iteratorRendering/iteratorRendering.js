import { LightningElement } from 'lwc';

export default class IteratorRendering extends LightningElement {

    taskList = [
        { taskId: 1, taskName: "Learn LWC", taskPriority: "High", taskStatus: "In Progress" },
        { taskId: 2, taskName: "Learn Apex", taskPriority: "High", taskStatus: "In Progress" },
        { taskId: 3, taskName: "Interview prep", taskPriority: "Medium", taskStatus: "In Progress" },
        { taskId: 4, taskName: "Gym", taskPriority: "Medium", taskStatus: "Slated" },
        { taskId: 5, taskName: "Guitar", taskPriority: "Low", taskStatus: "Pending" },
    ]


}