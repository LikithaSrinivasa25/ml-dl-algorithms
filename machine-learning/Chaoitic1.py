{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "b36d14df",
   "metadata": {},
   "outputs": [],
   "source": [
    "#Chaotic Program\n",
    "def main():\n",
    "    print(\"This program illustrates a chaotic function\")\n",
    "    x=eval(input(\"Enter a number between 0 and 1:\"))\n",
    "    for i in range(20):\n",
    "        x=3.9*x*(1-x)\n",
    "        print(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "2bac89a4",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "This program illustrates a chaotic function\n",
      "Enter a number between 0 and 1:.23\n",
      "0.69069\n",
      "0.8331855632099999\n",
      "0.5420507838268971\n",
      "0.9681037531602199\n",
      "0.12042761748153206\n",
      "0.41310674507409\n",
      "0.9455532927686853\n",
      "0.20078082688163068\n",
      "0.6258247571096014\n",
      "0.9132557089434082\n",
      "0.3089569042001561\n",
      "0.8326598886341254\n",
      "0.543415854126332\n",
      "0.967648748080876\n",
      "0.12208812883171866\n",
      "0.41801220875734446\n",
      "0.9487842081398878\n",
      "0.1895116646445899\n",
      "0.5990282750720829\n",
      "0.9367542628713668\n"
     ]
    }
   ],
   "source": [
    "main()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5266c413",
   "metadata": {},
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "44fece43",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "This program illustrates a chaotic function\n",
      "Enter a number between 0 and 1:.24\n",
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
      "0.9748889853252805\n",
      "0.09547376130522969\n",
      "0.3367982366091007\n",
      "0.8711242192617935\n",
      "0.4378405741215644\n",
      "0.9599312025204068\n"
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
   "id": "d7ed9276",
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
