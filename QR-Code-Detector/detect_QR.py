import cv2


#https://www.geeksforgeeks.org/realtime-distance-estimation-using-opencv-python/


def FocalLength(measured_distance, real_width, width_in_rf_image):
    focal_length = (width_in_rf_image* measured_distance)/ real_width
    return focal_length

def Distance_finder(Focal_Length, real_face_width, face_width_in_frame):
    distance = (real_face_width * Focal_Length)/face_width_in_frame
    return distance


FocalLength = FocalLength(20, 19.8, 500)
camera_id = 0
delay = 1
window_name = 'OpenCV QR Code'

# Define the known size of the QR code in millimeters
qr_size_mm = 140

qcd = cv2.QRCodeDetector()
cap = cv2.VideoCapture(camera_id)

while True:
    ret, frame = cap.read()

    if ret:
        # Detect and decode the QR code
        ret_qr, decoded_info, points, _ = qcd.detectAndDecodeMulti(frame)
        if ret_qr:
            for s, p in zip(decoded_info, points):
                if s:
                    #Calculate the distance from the camera to the QR code
                    distance_mm = Distance_finder(FocalLength, qr_size_mm, cv2.norm(p[0]-p[1]))
                    #Print the distance
                    print("Distance : " + str(distance_mm) + " mm ")
                    #Print the decoded QR code
                    print("Decoded QR message: " + str(s))
                    color = (0, 255, 0)
                else:
                    color = (0, 0, 255)
                # Draw the QR code location and the decoded message on the image
                frame = cv2.polylines(frame, [p.astype(int)], True, color, 8)
        cv2.imshow(window_name, frame)

    if cv2.waitKey(delay) & 0xFF == ord('q'):
        break

cv2.destroyWindow(window_name)