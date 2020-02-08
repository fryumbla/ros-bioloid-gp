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

class VrepSetSimStateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.operation = null;
    }
    else {
      if (initObj.hasOwnProperty('operation')) {
        this.operation = initObj.operation
      }
      else {
        this.operation = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepSetSimStateRequest
    // Serialize message field [operation]
    bufferOffset = _serializer.int32(obj.operation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepSetSimStateRequest
    let len;
    let data = new VrepSetSimStateRequest(null);
    // Deserialize message field [operation]
    data.operation = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepSetSimStateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '27c5e4a1048c143b919affa90d585d08';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 operation
    int32 SIM_START = 0
    int32 SIM_STOP = 1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepSetSimStateRequest(null);
    if (msg.operation !== undefined) {
      resolved.operation = msg.operation;
    }
    else {
      resolved.operation = 0
    }

    return resolved;
    }
};

// Constants for message
VrepSetSimStateRequest.Constants = {
  SIM_START: 0,
  SIM_STOP: 1,
}

class VrepSetSimStateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.err_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
      if (initObj.hasOwnProperty('err_msg')) {
        this.err_msg = initObj.err_msg
      }
      else {
        this.err_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepSetSimStateResponse
    // Serialize message field [result]
    bufferOffset = _serializer.int32(obj.result, buffer, bufferOffset);
    // Serialize message field [err_msg]
    bufferOffset = _serializer.string(obj.err_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepSetSimStateResponse
    let len;
    let data = new VrepSetSimStateResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [err_msg]
    data.err_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.err_msg.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepSetSimStateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c52e0efc9e949f620ee0e57623765f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 result
    int32 OK = 0
    int32 ERROR = 1
    string err_msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepSetSimStateResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    if (msg.err_msg !== undefined) {
      resolved.err_msg = msg.err_msg;
    }
    else {
      resolved.err_msg = ''
    }

    return resolved;
    }
};

// Constants for message
VrepSetSimStateResponse.Constants = {
  OK: 0,
  ERROR: 1,
}

module.exports = {
  Request: VrepSetSimStateRequest,
  Response: VrepSetSimStateResponse,
  md5sum() { return '058b8c1320f490e738017374cc564f52'; },
  datatype() { return 'bioloid_hardware/VrepSetSimState'; }
};
