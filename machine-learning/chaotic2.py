{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ed59aae1",
   "metadata": {},
   "outputs": [],
   "source": [
    "#Chaotic Program\n",
    "def main():\n",
    "    print(\"This program illustrates a chaotic function\")\n",
    "    x=eval(input(\"Enter a number between 0 and 1:\"))\n",
    "    n=int(input(\"Number of values to print:\"))\n",
    "    for i in range(n):\n",
    "        x=3.9*x*(1-x)\n",
    "        print(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "fbd17e2c",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "This program illustrates a chaotic function\n",
      "Enter a number between 0 and 1:.24\n",
      "Number of values to print:15\n",
      "0.71136\n",
      "0.80077510656\n",
      "0.6221839075679007\n",
      "0.916777261652611\n",
      "0.2975571852604691\n",
      "0.8151659363653104\n",
      "0.5876146869644107\n",
      "0.9450622998497004\n",
      "0.2024862420847321\n",
      "0.6297936990194279\n",
      "0.9092990232099312\n",
      "0.32164980743764526\n",
      "0.8509457143705869\n",
      "0.494664711703182\n",
      "0.9748889853252805\n"
     ]
    }
   ],
   "source": [
    "main()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7d21dcff",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
