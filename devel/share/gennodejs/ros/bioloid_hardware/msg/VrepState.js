// Auto-generated. Do not edit!

// (in-package bioloid_hardware.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class VrepState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vrep_state = null;
      this.action_state = null;
    }
    else {
      if (initObj.hasOwnProperty('vrep_state')) {
        this.vrep_state = initObj.vrep_state
      }
      else {
        this.vrep_state = 0;
      }
      if (initObj.hasOwnProperty('action_state')) {
        this.action_state = initObj.action_state
      }
      else {
        this.action_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepState
    // Serialize message field [vrep_state]
    bufferOffset = _serializer.int32(obj.vrep_state, buffer, bufferOffset);
    // Serialize message field [action_state]
    bufferOffset = _serializer.int32(obj.action_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepState
    let len;
    let data = new VrepState(null);
    // Deserialize message field [vrep_state]
    data.vrep_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [action_state]
    data.action_state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bioloid_hardware/VrepState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd63861455531e6f74503f4566b260146';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # vrep start/stop
    int32 vrep_state
    int32 SIM_STOPPED = 0
    int32 SIM_RUNNING = 1
    
    # vrep action state
    int32 action_state
    int32 READY_FOR_ACTION = 0
    int32 ACTION_RUNNING = 1
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepState(null);
    if (msg.vrep_state !== undefined) {
      resolved.vrep_state = msg.vrep_state;
    }
    else {
      resolved.vrep_state = 0
    }

    if (msg.action_state !== undefined) {
      resolved.action_state = msg.action_state;
    }
    else {
      resolved.action_state = 0
    }

    return resolved;
    }
};

// Constants for message
VrepState.Constants = {
  SIM_STOPPED: 0,
  SIM_RUNNING: 1,
  READY_FOR_ACTION: 0,
  ACTION_RUNNING: 1,
}

module.exports = VrepState;
