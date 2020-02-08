// Auto-generated. Do not edit!

// (in-package bioloid_hardware.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class VrepGetSimStateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dummy = null;
    }
    else {
      if (initObj.hasOwnProperty('dummy')) {
        this.dummy = initObj.dummy
      }
      else {
        this.dummy = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepGetSimStateRequest
    // Serialize message field [dummy]
    bufferOffset = _serializer.int32(obj.dummy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepGetSimStateRequest
    let len;
    let data = new VrepGetSimStateRequest(null);
    // Deserialize message field [dummy]
    data.dummy = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepGetSimStateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da6c21c6d030841e7157c3016b0292a3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 dummy
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepGetSimStateRequest(null);
    if (msg.dummy !== undefined) {
      resolved.dummy = msg.dummy;
    }
    else {
      resolved.dummy = 0
    }

    return resolved;
    }
};

class VrepGetSimStateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepGetSimStateResponse
    // Serialize message field [state]
    bufferOffset = _serializer.int32(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepGetSimStateResponse
    let len;
    let data = new VrepGetSimStateResponse(null);
    // Deserialize message field [state]
    data.state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepGetSimStateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fb64d65bd27f6cc1679ccef19165348';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 state
    int32 READY_STATE = 0
    int32 RUNNING_STATE = 1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepGetSimStateResponse(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    return resolved;
    }
};

// Constants for message
VrepGetSimStateResponse.Constants = {
  READY_STATE: 0,
  RUNNING_STATE: 1,
}

module.exports = {
  Request: VrepGetSimStateRequest,
  Response: VrepGetSimStateResponse,
  md5sum() { return '090b1ecdfa88ad0b24f5bc475c9bd86c'; },
  datatype() { return 'bioloid_hardware/VrepGetSimState'; }
};
