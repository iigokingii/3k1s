using System;

namespace Aircompany.Planes
{
    public class PassengerPlane : Plane
    {
        private int _passengersCapacity;
        public int PassengersCapacity { get { return _passengersCapacity; } }

        public PassengerPlane(string model, int maxSpeed, int maxFlightDistance, int maxLoadCapacity, int passengersCapacity)
            :base(model, maxSpeed, maxFlightDistance, maxLoadCapacity)
        {
            _passengersCapacity = passengersCapacity;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType()) return false;
            PassengerPlane other = (PassengerPlane)obj;
            return base.Equals(obj) && PassengersCapacity == other.PassengersCapacity;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(base.GetHashCode(), PassengersCapacity);
        }

        public int PassengersCapacityIs()
        {
            return _passengersCapacity;
        }

       
        public override string ToString()
        {
            return base.ToString() + $", passengersCapacity={PassengersCapacity}";
        }       
        
    }
}
