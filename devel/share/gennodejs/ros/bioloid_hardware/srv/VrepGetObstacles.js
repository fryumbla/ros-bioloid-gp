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

let vision_msgs = _finder('vision_msgs');

//-----------------------------------------------------------

class VrepGetObstaclesRequest {
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
    // Serializes a message object of type VrepGetObstaclesRequest
    // Serialize message field [dummy]
    bufferOffset = _serializer.int32(obj.dummy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepGetObstaclesRequest
    let len;
    let data = new VrepGetObstaclesRequest(null);
    // Deserialize message field [dummy]
    data.dummy = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepGetObstaclesRequest';
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
    const resolved = new VrepGetObstaclesRequest(null);
    if (msg.dummy !== undefined) {
      resolved.dummy = msg.dummy;
    }
    else {
      resolved.dummy = 0
    }

    return resolved;
    }
};

class VrepGetObstaclesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.names = null;
      this.obstacles = null;
    }
    else {
      if (initObj.hasOwnProperty('names')) {
        this.names = initObj.names
      }
      else {
        this.names = [];
      }
      if (initObj.hasOwnProperty('obstacles')) {
        this.obstacles = initObj.obstacles
      }
      else {
        this.obstacles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VrepGetObstaclesResponse
    // Serialize message field [names]
    bufferOffset = _arraySerializer.string(obj.names, buffer, bufferOffset, null);
    // Serialize message field [obstacles]
    // Serialize the length for message field [obstacles]
    bufferOffset = _serializer.uint32(obj.obstacles.length, buffer, bufferOffset);
    obj.obstacles.forEach((val) => {
      bufferOffset = vision_msgs.msg.BoundingBox3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VrepGetObstaclesResponse
    let len;
    let data = new VrepGetObstaclesResponse(null);
    // Deserialize message field [names]
    data.names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [obstacles]
    // Deserialize array length for message field [obstacles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacles[i] = vision_msgs.msg.BoundingBox3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.names.forEach((val) => {
      length += 4 + val.length;
    });
    length += 80 * object.obstacles.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioloid_hardware/VrepGetObstaclesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c29d5f3e677d402eaff3f7d766ec42f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] names
    vision_msgs/BoundingBox3D[] obstacles
    
    ================================================================================
    MSG: vision_msgs/BoundingBox3D
    # A 3D bounding box that can be positioned and rotated about its center (6 DOF)
    # Dimensions of this box are in meters, and as such, it may be migrated to
    #   another package, such as geometry_msgs, in the future.
    
    # The 3D position and orientation of the bounding box center
    geometry_msgs/Pose center
    
    # The size of the bounding box, in meters, surrounding the object's center
    #   pose.
    geometry_msgs/Vector3 size
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VrepGetObstaclesResponse(null);
    if (msg.names !== undefined) {
      resolved.names = msg.names;
    }
    else {
      resolved.names = []
    }

    if (msg.obstacles !== undefined) {
      resolved.obstacles = new Array(msg.obstacles.length);
      for (let i = 0; i < resolved.obstacles.length; ++i) {
        resolved.obstacles[i] = vision_msgs.msg.BoundingBox3D.Resolve(msg.obstacles[i]);
      }
    }
    else {
      resolved.obstacles = []
    }

    return resolved;
    }
};

module.exports = {
  Request: VrepGetObstaclesRequest,
  Response: VrepGetObstaclesResponse,
  md5sum() { return '426cd5f67aa6396d3bc5bc91413d573b'; },
  datatype() { return 'bioloid_hardware/VrepGetObstacles'; }
};
