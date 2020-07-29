#!/usr/bin/env python

import rospy
import math
import numpy as np

from sensor_msgs.msg import JointState
from std_msgs.msg import Header

#Dimensiones de la herramienta y el brazo
longTool= 0.04
armLengghts = [0.0564904, 0.0230096, 0.018, 0.0574, 0.0182, (0.0425+longTool)]
#Dimensiones de la pierna
LegLenghts = [0.0385, 0.031, 0.0145, 0.075, 0.0295]

#Funcion que calcula la cinematica inversa del brazo. Recibe los puntos x, y, z del espacio.
#Modifica por referencia un vector con el valor de los angulos en grados
def IK3ServoArm (xh, yh, zh):

    # std::cout << "Info: X= "<<xh << "  Y= "<<yh << "  Z= "<<zh <<endl


    
    ang=[0,0,0]
    
    #Ecuaciones para encontrar el angulo del servo del codo
    theta2 = math.atan2(zh,yh)
    ang[1]=theta2

    #Ecuacion para encontrar el angulo del servo del hombro horizontal
    s = math.sqrt(pow(xh,2) + pow(zh,2))
    t = xh
    Lra= math.sqrt(pow(s,2) + pow(t,2))
    C5=  (pow(Lra,2) - pow(armLengghts[2]+armLengghts[3],2) - pow(armLengghts[5],2)) / (2 * (armLengghts[2]+armLengghts[3]) * armLengghts[5])
    angleElbowRad = -math.atan2( math.sqrt(1-pow(C5,2)), C5 )
    ang[2]=angleElbowRad



    # #Ecuacion para encontrar el angulo del servo del hombro horizontal
    # servoBase = math.atan2(zh,xh)
    # ang=[0,0,0]
    # ang[0]=servoBase
    # #Ecuaciones para encontrar el angulo del servo del codo
    # s = math.sqrt(pow(xh,2) + pow(zh,2))- armLengghts[2]
    # t = -yh - armLengghts[0] - armLengghts[1]
    # Lra= math.sqrt(pow(s,2) + pow(t,2))
    # C5=  (pow(Lra,2) - pow(armLengghts[3],2) - pow(armLengghts[4],2)) / (2 * armLengghts[3] * armLengghts[4])
    # angleElbowRad = -math.atan2( math.sqrt(1-pow(C5,2)), C5 )
    # ang[2]=angleElbowRad

    # #Ecuaciones para encontrar el angulo del servo del hombro vertical
    # gamma1= math.atan2(s,t)
    # gamma2= math.atan2( (armLengghts[4]*math.sin(-angleElbowRad)), (armLengghts[3]+armLengghts[4]*math.cos(-angleElbowRad)))
    # servoShoulder = -(gamma1-gamma2)
    # ang[1]=servoShoulder
    print(ang)

    return ang


#Funcion que recibe 3 angulos calculados de la cinematica inversa y los ajusta a las especificaciones
#del brazo del robot Bioloid y los servos Dynamixel.
#Modifica por referencia un vector con el valor de los angulos en grados
# def IKAdjust3ServoArm (ang[3]):

#     #Cuando los 2 angulos son cero, en casi todos los casos corresponde a un punto no alcanzable
#     if ((ang[1]==0) || (ang[2]==0)){
#             # std::cout << "Error: La posicion en el espacio no es alcanzable."<<endl
#     }

#     #Ajusta el angulo de la base en base.
#     servoBaseRX10= 152-(90-ang[0]) #150: ajuste del RX, 90-: ajuste con el eje de coordenadas
#     if ((servoBaseRX10<0) || (servoBaseRX10>300)){
#         # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo de la base."<<endl
#         ang[0]=150  #Pone la posicion por defecto del servo
#     }else{
#         ang[0]=servoBaseRX10
#     }

#     ang[0]=servoBaseRX10

#     #Ajusta el angulo del hombro
#     servoShoulderRX10= 150-(ang[1]) #150-: ajuste del RX
#     #Revisa los valores maximos y minimos del servo
#     if ((servoShoulderRX10<0) || (servoShoulderRX10>300)){
#         # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo del hombro."<<endl
#         ang[1]=150  #Pone la posicion por defecto del servo
#     }else if (servoShoulderRX10<60){
#             # std::cout << "Error: La posicion deseada provoca colosion en el servo del hombro. Servo saturado a su valor minimo."<<endl
#         ang[1]=60
#     }else if (servoShoulderRX10>240){
#         # std::cout << "Error: La posicion deseada provoca colosion en el servo del hombro. Servo saturado a su valor maximo."<<endl
#         ang[1]=240
#     }else{
#         ang[1]=servoShoulderRX10
#     }

#     #Ajusta el angulo del codo
#     servoElbowRX10= 150-(ang[2]) #150-: ajuste del RX
#     #Revisa los valores maximos y minimos del servo
#     if ((servoElbowRX10<0) || (servoElbowRX10>300)){
#         # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo del codo."<<endl
#         ang[2]=150 #Pone la posicion por defecto del servo
#     }else if (servoElbowRX10<60){
#             # std::cout << "Error: La posicion deseada provoca colision en el servo del codo. Servo saturado a su valor minimo."<<endl
#         ang[2]=60
#     }else if (servoElbowRX10>240){
#         # std::cout << "Error: La posicion deseada provoca colosion en el servo del codo. Servo saturado a su valor maximo."<<endl
#         ang[2]=240
#     }else{
#         ang[2]=servoElbowRX10
#     }

#     # std::cout << "Info: Ang Corregidos. Base: "<<ang[0]<< "  Hombro: "<<ang[1]<<"  Codo: "<<ang[2]<<endl


#Funcion que calcula la cinematica inversa de la pierna del robot, toma como referencia el pie y ubica la cadera
#Recibe los puntos x, y, z de la ubicacion deseada de la cadera. Tambien los angulos pitch, roll, yaw de la orientacion deseada.
#Modifica por referencia un vector con el valor de los angulos en grados. Estos angulos toman el eje x del servo como cero
def IK6ServoLegtoHip(xH,yH,zH,pitchH,rollH,yawH):

    # std::cout<<endl << "PosHip: X= "<<xH << "  Y= "<<yH << "  Z= "<<zH <<endl

    #L6 = LegLenghts[1]
    L7 = 0.8
    L8 = 0.7

    #Calculo del angulo Roll del tobillo para la Posicion
    ankle_roll= round (math.atan2(yH,zH) )

    #Calculo del angulo Pitch de la Rodilla para la Posicion
    Lrleg= math.sqrt( pow(xH,2) + pow(yH,2) + pow(zH,2) ) #extension de la pierna
    Lf= math.sqrt( pow(L7,2) + pow(L8,2) ) #extension del muslo o la pantorrilla
    alpha= math.atan2(L7,L8) #angulo en que esta desviado el servo de la rodilla del punto de flexion

    math.cos_gamma= (pow(Lrleg,2) - 2*pow(Lf,2))/(-2*pow(Lf,2)) #ley de math.cosenos para el angulo de la rodilla
    gamma= math.atan2( math.sqrt(1-pow(math.cos_gamma,2)), math.cos_gamma) #angulo de la rodilla math.sin corregir desvio
    knee_pitch = round( (gamma - 2*alpha)) #angulo del servo (corregido)

    #Calculo del angulo Pitch del tobillo para la Posicion
    Lrleg_prime = math.sqrt(pow(yH,2) + pow(zH,2))  #proyecccion en Z de la extension de la pierna
    beta= math.atan2( xH, Lrleg_prime) #angulo entre proyecccion y extensi'n
    #ankle_pitch = round( (-beta + (gamma/2)))   #Para Matlab, math.sin alpha
    ankle_pitch = round( (-beta + (gamma/2) - alpha)) #Real, usa el valor de alpha

    #Calculo del angulo Yaw de la cadera para la Orientacion
    # hip_yaw = round( yawH )

    #Calculo del angulo Roll de la cadera para la Orientacion
    hip_roll = round( (rollH - ankle_roll) )

    #Calculo del angulo Pitch de la cadera para la Orientacion
    #hip_pitch = pitchPel + beta + gamma/2 #para Matlab
    hip_pitch = round( (-pitchH*math.pi/180 + beta + gamma/2 - alpha)) #Real

    #Los angulos obtenidos se almacenan en el vector de salida
    ang = [0,0,0,0,0]
    # ang[0]= hip_yaw
    ang[0]= hip_roll
    ang[1]= ((math.pi/2)-hip_pitch)
    ang[2]= -(math.pi-knee_pitch)
    ang[3]= ((math.pi/2)-ankle_pitch)
    ang[4]= ankle_roll
    print(ang)
    return ang


#Funcion que calcula la cinematica inversa de la pierna del robot, toma como referencia la cadera y ubica el pie
#Recibe los puntos x, y, z de la ubicacion deseada del pie. La cadera se orienta a 0 en pitch, roll y yaw.
#Modifica por referencia un vector con el valor de los angulos en grados. Estos angulos toman el eje x del servo como cero
def IK6ServoLegtoFoot (xFi, yFi, zFi):
    # std::cout<<endl << "PosFoot: X= "<<xFi << "  Y= "<<yFi << "  Z= "<<zFi <<endl
    #Convertimos las coordenadas como si la referencia fuera el del pie a la cadera (al reves) y con
    #eso podemos usar las ecuaciones de cinematica inversa de ese caso. Para este caso la orientacion
    #de la cadera se toma como cero.
    pitchH=0
    rollH=0
    yawH=0
    zF=-zFi
    xF=-xFi
    yF=-yFi

    #L6 = LegLenghts[1]
    L7 = 0.0145
    L8 = 0.075

    #Calculo del angulo Roll del tobillo para la Posicion
    ankle_roll= round(math.atan2(yF,zF) )

    #Calculo del angulo Pitch de la Rodilla para la Posicion
    Lrleg= math.sqrt( pow(xF,2) + pow(yF,2) + pow(zF,2) ) #extension de la pierna
    Lf= math.sqrt( pow(L7,2) + pow(L8,2) ) #extension del muslo o la pantorrilla
    alpha= math.atan2(L7,L8) #angulo en que esta desviado el servo de la rodilla del punto de flexion

    math.cos_gamma= (pow(Lrleg,2) - 2*pow(Lf,2))/(-2*pow(Lf,2)) #ley de math.cosenos para el angulo de la rodilla
    gamma= math.atan2( math.sqrt(1-pow(math.cos_gamma,2)), math.cos_gamma) #angulo de la rodilla math.sin corregir desvio
    knee_pitch = round( (gamma - 2*alpha)) #angulo del servo (corregido)

    #Calculo del angulo Pitch del tobillo para la Posicion
    Lrleg_prime = math.sqrt(pow(yF,2) + pow(zF,2))  #proyecccion en Z de la extension de la pierna
    beta= math.atan2( xF, Lrleg_prime) #angulo entre proyecccion y extensi'n
    #ankle_pitch = round( (-beta + (gamma/2)))   #Para Matlab, math.sin alpha
    ankle_pitch = round( (-beta + (gamma/2) - alpha)) #Real, usa el valor de alpha

    #Calculo del angulo Yaw de la cadera para la Orientacion
    hip_yaw = round( yawH )

    #Calculo del angulo Roll de la cadera para la Orientacion
    hip_roll = round( rollH + ankle_roll)

    #Calculo del angulo Pitch de la cadera para la Orientacion
    #hip_pitch = pitchPel + beta + gamma/2 #para Matlab
    hip_pitch = round( (-pitchH*math.pi/180 + beta + gamma/2 - alpha)) #Real

    #Los angulos obtenidos se almacenan en el vector de salida
    ang = [0,0,0,0,0,0]
    ang[0]= hip_yaw
    ang[1]= hip_roll
    ang[2]= (90-hip_pitch)
    ang[3]= -(180-knee_pitch)
    ang[4]= (90-ankle_pitch)
    ang[5]= ankle_roll
    print(ang)


# #Funcion que recibe 6 angulos calculados de la cinematica inversa  de una pierna y los ajusta a las
# #especificaciones del robot Bioloid y los servos Dynamixel. Diferencia entre pierna derecha o izquierda.
# #Modifica por referencia un vector con el valor de los angulos en grados
# def IKAdjust6ServoLeg (ang[6], const bool isRightLeg){

#     #Variable de ajuste entre la pierna izquierda y la derecha, se utiliza en las formulas
#     legDir= 1
#     minLimitHY = lowerLimitHipYaw
#     maxLimitHY = upperLimitHipYaw

#     minLimitHP = lowerLimitHipPitch
#     maxLimitHP = upperLimitHipPitch

#     minLimitKP = lowerLimitKneePitch
#     maxLimitKP = upperLimitKneePitch

#     minLimitAP = lowerLimitAnklePitch
#     maxLimitAP = upperLimitAnklePitch

#     #Reajusta los limites cuando es la pierna izquierda
#     if (not isRightLeg) {
#         legDir=-1
#         minLimitHY= 300 - upperLimitHipYaw
#         maxLimitHY= 300 - lowerLimitHipYaw
#         minLimitHP = 300 - upperLimitHipPitch
#         maxLimitHP = 300 - lowerLimitHipPitch
#         minLimitKP = 300 - upperLimitKneePitch
#         maxLimitKP = 300 - lowerLimitKneePitch
#         minLimitAP = 300 - upperLimitAnklePitch
#         maxLimitAP = 300 - lowerLimitAnklePitch
#     }

#     #Cuando los 2 angulos son cero y la rodilla 180, en casi todos los casos corresponde a un punto no alcanzable
#     if ((ang[2]==0) && (ang[3]==180) && (ang[4]==0)){
            # std::cout << "Error: La posicion en el espacio no es alcanzable."<<endl
#     }

#     #Ajusta el angulo del servo Yaw de la cadera.
#     servoHipYaw= 150-legDir*45+ang[0] #150: ajuste del Servo, 45: ajuste con el eje de coordenadas
#     if ((servoHipYaw<0) || (servoHipYaw>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Hip Yaw."<<endl
#         ang[0]=150-45  #Pone la posicion por defecto del servo
#     }else if ( servoHipYaw < minLimitHY ){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Yaw. Servo saturado a su valor minimo."<<endl
#         ang[0]=minLimitHY
#     }else if ( servoHipYaw > maxLimitHY ){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Yaw. Servo saturado a su valor maximo."<<endl
#         ang[0]=maxLimitHY
#     }else{
#         ang[0]=servoHipYaw
#     }

#     #Ajusta el angulo del servo Roll de la cadera.
#     servoHipRoll= 150-ang[1] #150: ajuste del Servo
#     if ((servoHipRoll<0) || (servoHipRoll>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Hip Roll."<<endl
#         ang[1]=150  #Pone la posicion por defecto del servo
#     }else if (servoHipRoll<lowerLimitHipRoll){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Roll. Servo saturado a su valor minimo."<<endl
#         ang[1]=lowerLimitHipRoll
#     }else if (servoHipRoll>upperLimitHipRoll){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Roll. Servo saturado a su valor maximo."<<endl
#         ang[1]=upperLimitHipRoll
#     }else{
#         ang[1]=servoHipRoll
#     }

#     #Ajusta el angulo del servo Pitch de la cadera.
#     servoHipPitch= 150-legDir*ang[2] #150: ajuste del Servo
#     if ((servoHipPitch<0) || (servoHipPitch>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Hip Pitch."<<endl
#         ang[2]=150  #Pone la posicion por defecto del servo
#     }else if (servoHipPitch<minLimitHP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Pitch. Servo saturado a su valor minimo."<<endl
#         ang[2]=minLimitHP
#     }else if (servoHipPitch>maxLimitHP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Hip Pitch. Servo saturado a su valor maximo."<<endl
#         ang[2]=maxLimitHP
#     }else{
#         ang[2]=servoHipPitch
#     }

#     #Ajusta el angulo del servo Pitch de la rodilla.
#     servoKneePitch= 150+legDir*ang[3] #150: ajuste del Servo
#     if ((servoKneePitch<0) || (servoKneePitch>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Knee Pitch."<<endl
#         ang[3]=150  #Pone la posicion por defecto del servo
#     }else if (servoKneePitch<minLimitKP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Knee Pitch. Servo saturado a su valor minimo."<<endl
#         ang[3]=minLimitKP
#     }else if (servoKneePitch>maxLimitKP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Knee Pitch. Servo saturado a su valor maximo."<<endl
#         ang[3]=maxLimitKP
#     }else{
#         ang[3]=servoKneePitch
#     }

#     #Ajusta el angulo del servo Pitch del tobillo.
#     if (not isRightLeg) { legDir=-1 }
#     servoAnklePitch= 150+legDir*ang[4] #150: ajuste del Servo
#     if ((servoAnklePitch<0) || (servoAnklePitch>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Ankle Pitch."<<endl
#         ang[4]=150  #Pone la posicion por defecto del servo
#     }else if (servoAnklePitch<minLimitAP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Ankle Pitch. Servo saturado a su valor minimo."<<endl
#         ang[4]=minLimitAP
#     }else if (servoAnklePitch>maxLimitAP){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Ankle Pitch. Servo saturado a su valor maximo."<<endl
#         ang[4]=maxLimitAP
#     }else{
#         ang[4]=servoAnklePitch
#     }

#     #Ajusta el angulo del servo Roll del tobillo.
#     servoAnkleRoll= 150-ang[5] #150: ajuste del Servo
#     if ((servoAnkleRoll<0) || (servoAnkleRoll>300)){
        # std::cout << "Error: La posicion deseada no es alcanzable. Error de valor en el servo Ankle Roll."<<endl
#         ang[5]=150  #Pone la posicion por defecto del servo
#     }else if (servoAnkleRoll<lowerLimitAnkleRoll){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Ankle Roll. Servo saturado a su valor minimo."<<endl
#         ang[5]=lowerLimitAnkleRoll
#     }else if (servoAnkleRoll>upperLimitAnkleRoll){
        # std::cout << "Error: La posicion deseada provoca colosion en el servo Ankle Roll. Servo saturado a su valor maximo."<<endl
#         ang[5]=upperLimitAnkleRoll
#     }else{
#         ang[5]=servoAnkleRoll
#     }


    # std::cout << "Info: ang corregidos:  Hip Yaw: "<<ang[0]<< "  Hip Roll: "<<ang[1]<<"  Hip Pitch: "<<ang[2]<<endl
    # std::cout << "Info: ang corregidos:  Knee Pitch: "<<ang[3]<< "  Ankle Pitch: "<<ang[4]<<"  Ankle Roll: "<<ang[5]<<endl
# }


def main():
    rospy.init_node("stand_up")

    while not rospy.is_shutdown():
        angr=IK3ServoArm(0.02,-0.05,0.08)
        angl=IK3ServoArm(0.02,0.05,0.08)

        angrl=IK6ServoLegtoHip(0,-0.05,-0.15,0,0,0)



        number = input ("Enter number: ")
        if (number==1):
            joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        if (number==2):
            print("dos")
            # joint_position_state=[angr[0],0,angr[1],0,angr[2],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            joint_position_state=[angr[0],angl[0],angr[1],angl[1],angr[2],angl[2],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        if (number==3):
            #parado
            joint_position_state=[0,0,0,0,0,0,0,0,angrl[0],0,angrl[1],0,angrl[2],0,angrl[3],0,angrl[4],0,0,0,0]
        if (number==4):
            #derecha alza
            joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,0,0,0,0,0,0,0,0,0,0,0.3,0.5]		
        if (number==5):
            # primer paso
            joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,0,0,0,0,0,0,0,0,0,0,-0.3,0]
        if (number==6):
            joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0.3,0,0,0,0,0,0,0,0,0,0,0,0]	
        if (number==7):
            # segundo paso
            joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,0,0,0,0,0,0,0,0,0,0,0,0]
        if (number==8):
            # segundo paso
            joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,-0.3,0,0,0,0,0,0,0,0,0,0,0]
        if (number==9):
            # segundo paso
            joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

                    
        pub = rospy.Publisher('joint_states', JointState, queue_size=10)
        # rate = rospy.Rate(1000000) # 10hz
        joints_states = JointState()
        joints_states.header = Header()
        joints_states.header.stamp = rospy.Time.now()
        joints_states.name = ["joint_1","joint_2","joint_3","joint_4","joint_5","joint_6","joint_7","joint_8","joint_9","joint_10","joint_11","joint_12","joint_13","joint_14","joint_15","joint_16","joint_17","joint_18","joint_19","joint_20","joint_21"]
        joints_states.position = joint_position_state
        pub.publish(joints_states)
        rate = rospy.Rate(10) # 10hz   
        # rospy.sleep(5)

if __name__ == '__main__':
    main()